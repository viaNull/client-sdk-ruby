# frozen_string_literal: true

require_relative "platon/version"
require 'active_support'
require 'active_support/core_ext'
require 'digest/sha3'

module Platon
  class Error < StandardError; end
  # Your code goes here...

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
end
