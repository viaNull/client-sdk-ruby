# frozen_string_literal: true

require_relative "platon/version"
require 'active_support'
require 'active_support/core_ext'
require 'digest/sha3'

require 'ffi'
require 'money-tree'
require 'rlp'

require 'bech32'

module Platon

  BYTE_ZERO = "\x00".freeze
  UINT_MAX = 2**256 - 1

  class << self

    def replayable_chain_id
      27
    end

    # def chain_id
    #   configuration.chain_id
    # end

    def v_base
      replayable_chain_id
    end

    def replayable_v?(v)
      [replayable_chain_id, replayable_chain_id + 1].include? v
    end

    # def tx_data_hex?
    #   !!configuration.tx_data_hex
    # end

    def chain_id_from_signature(signature)
      return nil if Platon.replayable_v?(signature[:v])

      cid = (signature[:v] - 35) / 2
      (cid < 1) ? nil : cid
    end

  # def self.configuration
  #   @configuration ||= Configuration.new
  # end

  # class Configuration
  #   attr_accessor :chain_id

  #   # Default network config to Alaya
  #   def initialize
  #     self.chain_id = 201018
  #     self.hrp = "atp"
  #   end
  # end
  end

  require 'platon/abi'
  require 'platon/client'
  require 'platon/ipc_client'
  require 'platon/http_client'
  require 'platon/singleton'
  require 'platon/solidity'
  require 'platon/initializer'
  require 'platon/contract'
  require 'platon/explorer_url_helper'
  require 'platon/function'
  require 'platon/function_input'
  require 'platon/function_output'
  require 'platon/contract_event'
  require 'platon/encoder'
  require 'platon/decoder'
  require 'platon/formatter'
  require 'platon/transaction'
  require 'platon/deployment'
  require 'platon/project_initializer'
  require 'platon/contract_initializer'
  require 'platon/railtie' if defined?(Rails)

  require 'platon/ppos'

  autoload :Address, 'platon/address'
  autoload :Gas, 'platon/gas'
  autoload :Key, 'platon/key'
  autoload :OpenSsl, 'platon/open_ssl'
  autoload :Secp256k1, 'platon/secp256k1'
  autoload :Sedes, 'platon/sedes'
  autoload :Tx, 'platon/tx'
  autoload :Utils, 'platon/utils'

  autoload :SegwitAddr, 'platon/segwit_addr'

  class ValidationError < StandardError; end
  class InvalidTransaction < ValidationError; end
end


  #TODO for test
  # $client = Platon::HttpClient.new("http://164.90.144.200:6789")
  # $client = Platon::HttpClient.new("http://alayanode:6666")  ## platon dev
  $client = Platon::HttpClient.new("http://arpcdev.pan.finance:7777") ## alaya dev
  # $client = Platon::HttpClient.new("http://47.241.98.219:6789")##platon dev
  # $client.set_network(:platondev)
  # $client.set_network(:alaya)
  $client.set_network(:alayadev)

  $key = Platon::Key.new(priv:"f06f1e91321cc6ba1d47f9ae707a425d3fb470bd15c6682f82fb696cf6b5587f")
  $key2 = Platon::Key.new(priv:"021a632fb0e115a0368f9b0277520c0df68dcdfbed46278dd4c56260cd3ab85b")

  $key3 = Platon::Key.new(priv:"4f033ff3e2e2b42b93fff645c0e0342d133fb6878e9b86ff2b0014a48737b5f5")
