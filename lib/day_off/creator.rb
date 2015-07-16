require 'day_off/day_off'
require 'json'

class DayOffCreator
  def initialize(repository)
    @repository = repository
  end

  def do(params)
    day_off = DayOff.new(JSON.parse(params, symbolize_names: true))
    @repository.store(day_off)
  end
end
