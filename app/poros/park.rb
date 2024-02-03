class Park
  attr_reader :id, 
              :name,
              :designation,
              :description, 
              :states, 
              :media,  
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
    @designation = data[:designation]
    @description = data[:description]
    @states = data[:states]
    @media = data[:images]
    @active_alerts = data[:alerts] # need to build
    @things_to_do = self.get_things_to_do(data[:activities])
    @ammenities = data[:amenities] # need to build
    @campgrounds = data[:campgrounds] # need to build
    @events = data[:events] # need to build
    @hours_of_operation = self.get_hours_of_operation(data[:operatingHours])
    @weather = self.get_weather(data[:addresses])
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

  def get_weather(addresses)
    WeatherService.get_weather(addresses)
  end
end