class DayOffRepository
  def initialize
    @days_off = {}
    @index = 1
  end

  def store(day_off)
    @days_off[@index] = day_off
    @index += 1
  end

  def retrieve(id)
    @days_off[id]
  end

  def remove(id)
    @days_off.delete(id)
  end
end
