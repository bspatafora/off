require 'json'
require 'rack/test'

require_relative '../lib/day_off/factory'
require_relative '../../api/config'
require_relative '../../api/days_off'
require_relative '../../lib/day_off/model'

describe 'a days off API' do
  include Rack::Test::Methods

  # Used by Rack::Test
  def app
    Sinatra::Application
  end

  def day_off_from_response(response)
    DayOff::Model.new(json_parse(response.body))
  end

  def json_parse(json)
    JSON.parse(json, symbolize_names: true)
  end

  it 'responds with a day off by ID' do
    day_off = DAY_OFF_REPO.store(DayOff::Factory.make(id: 0))

    get '/v1/days_off/0'

    expect(last_response).to be_ok
    expect(day_off_from_response(last_response)).to eq(day_off)
  end
end
