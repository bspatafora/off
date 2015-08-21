require 'json'

require_relative 'day_off'

class DayOffCreator
  def initialize(repository)
    @repository = repository
  end

  def do(params)
    parsed_params = JSON.parse(params, symbolize_names: true)

    day_off = DayOff.new(parsed_params)
    @repository.store(day_off)
  end
end
