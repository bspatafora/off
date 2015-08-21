require 'json'

require_relative 'model'

module DayOff
  class Creator
    def initialize(repository)
      @repository = repository
    end

    def do(params)
      parsed_params = JSON.parse(params, symbolize_names: true)

      day_off = DayOff::Model.new(parsed_params)
      @repository.store(day_off)
    end
    end
  end
