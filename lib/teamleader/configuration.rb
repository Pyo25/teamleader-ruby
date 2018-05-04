class Configuration
  attr_accessor :api_group, :api_secret

  def initialize
    @api_group = 'Your API group'
    @api_secret = 'Your API secret'
  end
end
