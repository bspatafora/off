require 'sinatra'

require_relative '../lib/day_off/presenter'
require_relative '../spec/day_off/factory'

get '/v1/days_off/:id' do
  content_type :json
  response.headers['Access-Control-Allow-Origin'] = '*'

  DayOff::Presenter.do(DayOff::Factory.make)
end
