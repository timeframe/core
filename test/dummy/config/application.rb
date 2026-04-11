# frozen_string_literal: true

require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "global_id/railtie"

Bundler.require(*Rails.groups)
require "timeframe_core"

module Dummy
  class Application < Rails::Application
    config.root = File.expand_path("..", __dir__)
    config.autoloader = :zeitwerk
    config.secret_key_base = "test-secret-key-base-for-dummy-app"
    config.hosts.clear
    config.eager_load = false
  end
end
