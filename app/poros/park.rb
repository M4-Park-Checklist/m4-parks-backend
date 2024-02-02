class Park
  attr_reader :id, :name, :states, :media, :recent_news, :active_alerts, :things_to_do, :ammenities, :campgrounds, :events, :activities, :hours_of_operation, :weather
  
  def initialize(data)
    @id = data[:id],
    @name = data[:fullName],
    @states = data[:states],
    @media = data,
    @recent_news = data[:news],
    @active_alerts = data[:alerts],
    @things_to_do = data[:activities],
    @ammenities = data[:amenities],
    @campgrounds = data[:campgrounds],
    @events = data[:events],
    @activities = data[:activities],
    @hours_of_operation = data[:operatingHours],
    @weather = data[:weather]
  end
end