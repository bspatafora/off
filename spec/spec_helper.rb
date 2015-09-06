require 'rspec'

ENV['RACK_ENV'] = 'test'

RSpec.configure { |c| c.order = 'random' }
