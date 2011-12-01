require "instant_oauth2/version"

module InstantOAuth2
  autoload :API, 'instant_oauth2/api'
  module Helpers
    autoload :Global, 'instant_oauth2/helpers/global'
  end

  class Configuration
    attr_accessor :client_class

    def initialize
      @client_class = (ClientApplication rescue nil)
    end
  end

  def self.ClientApplication
    config.client_class
  end

  def self.config
    @@config ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
