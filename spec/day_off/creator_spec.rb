require 'json'
require 'day_off/creator'
require 'day_off/factory'

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

    retrieved_day_off = repository.retrieve(day_off.id)
    expect(retrieved_day_off.user_id).to eq day_off.user_id
    expect(retrieved_day_off.start_time).to eq day_off.start_time
    expect(retrieved_day_off.end_time).to eq day_off.end_time
    expect(retrieved_day_off.type_id).to eq day_off.type_id
  end
end
