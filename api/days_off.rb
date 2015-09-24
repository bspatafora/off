require 'sinatra'

require_relative 'config'

require_relative '../lib/day_off/presenter'
require_relative '../spec/lib/day_off/factory'

get '/v1/days_off/:id' do
  content_type :json
  response.headers['Access-Control-Allow-Origin'] = '*'

  id = params[:id].to_i
  DayOff::Presenter.do(DAY_OFF_REPO.retrieve(id))
end
