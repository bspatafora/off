require 'day_off/day_off'
require 'day_off/day_off_repository'

describe 'a day off repository' do
  it 'stores days off' do
    repository = DayOffRepository.new
    day_off = DayOff.new

    repository.store(day_off)

    retrieved_day_off = repository.retrieve(1)
    expect(retrieved_day_off.user_id).to eq day_off.user_id
    expect(retrieved_day_off.start_time).to eq day_off.start_time
    expect(retrieved_day_off.end_time).to eq day_off.end_time
    expect(retrieved_day_off.type_id).to eq day_off.type_id
  end

  it 'removes days off' do
    day_off_repository = DayOffRepository.new
    day_off_repository.store(DayOff.new)
    expect(day_off_repository.retrieve(1)).not_to eq nil

    day_off_repository.remove(1)

    expect(day_off_repository.retrieve(1)).to eq nil
  end
end
