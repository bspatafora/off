require 'json'

require_relative '../../lib/day_off/creator'
require_relative '../../lib/day_off/day_off_repository'
require_relative 'factory'

describe 'a day off creator' do
  def json(day_off)
    attribute_pairs = day_off.instance_variables.map do |attribute|
      key = attribute.to_s.delete('@')
      value = day_off.instance_variable_get(attribute)
      [key, value]
    end

    JSON.generate(attribute_pairs.to_h)
  end

  it 'creates days off from JSON params' do
    repository = DayOffRepository.new
    creator = DayOffCreator.new(repository)
    day_off = DayOffFactory.make

    creator.do(json(day_off))

    expect(repository.retrieve(day_off.id)).to eq day_off
  end
end
