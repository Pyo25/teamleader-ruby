require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/extended_api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'teamleader/version'))

module Teamleader
  extend self

  def new(group, secret)
    ExtendedApi.new(group, secret)
  end
end
