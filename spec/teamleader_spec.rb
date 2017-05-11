require 'spec_helper'
require 'vcr'

describe Teamleader do
  it 'has a version number' do
    expect(Teamleader::VERSION).not_to be nil
  end
end
