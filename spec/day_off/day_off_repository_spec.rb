require 'day_off/day_off'
require 'day_off/day_off_repository'

describe 'a day off repository' do
  it 'stores days off' do
    repository = DayOffRepository.new
    day_off = DayOffFactory.make

    repository.store(day_off)

    expect(repository.retrieve(1)).to eq day_off
  end

  it 'removes days off' do
    day_off_repository = DayOffRepository.new
    day_off_repository.store(DayOff.new)
    expect(day_off_repository.retrieve(1)).not_to eq nil

    day_off_repository.remove(1)

    expect(day_off_repository.retrieve(1)).to eq nil
  end
end
