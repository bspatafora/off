class DayOff
  attr_reader :id, :user_id, :start_time, :end_time, :type_id

  def initialize(args = {})
    @id = args[:id]
    @user_id = args[:user_id]
    @start_time = args[:start_time]
    @end_time = args[:end_time]
    @type_id = args[:type_id]
  end
end
