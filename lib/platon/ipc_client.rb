require 'socket'
module Platon
  class IpcClient < Client
    attr_accessor :ipcpath

    IPC_PATHS = [  
      "#{ENV['HOME']}/platon-node/data/platon.ipc",
      "#{ENV['HOME']}/alaya-node/data/platon.ipc"
    ]

    def initialize(ipcpath = nil, log = true)
      super(log)
      ipcpath ||= IpcClient.default_path
      @ipcpath = ipcpath
    end

    def self.default_path(paths = IPC_PATHS)
      path = paths.select { |path| File.exist?(path) }.first
      path || raise("Ipc file not found. Please pass in the file path explicitly to IpcClient initializer")
    end

    def send_single(payload)
      socket = UNIXSocket.new(@ipcpath)
      socket.puts(payload)
      read = socket.recvmsg(nil)[0]
      socket.close
      return read
    end

    # Note: Guarantees the results are in the same order as defined in batch call.
    # client.batch do
    #   client.platon_block_number
    #   client.platon_mining
    # end
    # => [{"jsonrpc"=>"2.0", "id"=>1, "result"=>"0x26"}, {"jsonrpc"=>"2.0", "id"=>2, "result"=>false}] 
    def send_batch(batch)
      result = send_single(batch.to_json)
      result = JSON.parse(result)

      # Make sure the order is the same as it was when batching calls
      # See 6 Batch here http://www.jsonrpc.org/specification
      return result.sort_by! { |c| c['id'] }
    end
  end
end
