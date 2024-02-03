class Park
  attr_reader :id, 
              :name, 
              :description, 
              :states, 
              :media, 
              :recent_news, 
              :active_alerts, 
              :things_to_do, 
              :ammenities, 
              :campgrounds, 
              :events,  
              :hours_of_operation, 
              :weather
  
  def initialize(data)
    @id = data[:id]
    @name = data[:fullName]
    @description = data[:description]
    @states = data[:states]
    @media = data[:images]
    @active_alerts = data[:alerts] # may need to consume new endpoint
    @things_to_do = self.get_things_to_do(data[:activities])
    @ammenities = data[:amenities]
    @campgrounds = data[:campgrounds]
    @events = data[:events]
    @hours_of_operation = self.get_hours_of_operation(data[:operatingHours])
    @weather = data[:weather]
  end

  private

  def get_things_to_do(activities)
    activities_array = []
    activities.each do |activity|
      activities_array << activity[:name]
    end
    activities_array
  end

  def get_hours_of_operation(operating_hours)
    hours_hash = {}
    operating_hours.each do |hours|
      hours_hash[hours[:name]] = hours[:standardHours]
    end
    hours_hash
  end
end