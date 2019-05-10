
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api/calls'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api/custom_fields'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api/files'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api/projects'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/extended_api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/version'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/configuration'))

module Teamleader
  extend self
  attr_accessor :configuration

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end

  def new(group = Teamleader.configuration.api_group, secret = Teamleader.configuration.api_secret)
    ExtendedApi.new(group, secret)
  end
end
