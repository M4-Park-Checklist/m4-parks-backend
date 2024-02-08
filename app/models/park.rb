class Park < ApplicationRecord
  validates_presence_of :nps_id,
                        :name

  has_many :user_parks
  has_many :users, through: :user_parks

  attr_reader :id, 
              :name,
              :designation,
              :description, 
              :park_code,
              :states, 
              :media,  
              :active_alerts, 
              :things_to_do, 
              :amenities, 
              :hours_of_operation, 
              :current_weather
  
  def initialize(data, single_park = false)
    @id = data[:id]
    @name = data[:fullName]
    @designation = data[:designation]
    @description = data[:description]
    @park_code = data[:parkCode]
    @states = data[:states]
    @media = data[:images]
    @single_park = single_park
    
    if @single_park == true
      @active_alerts = self.get_active_alerts(data)
      @things_to_do = self.get_things_to_do(data[:activities])
      @amenities = self.get_amenities(data)
      @hours_of_operation = self.get_hours_of_operation(data[:operatingHours])
      @current_weather = self.get_weather(data[:addresses])
    end
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
    weather = WeatherService.get_weather(addresses)
    weather[:data][:attributes][:current_weather]
  end

  def get_active_alerts(data)
    alerts = ParkService.get_alerts(data[:parkCode])
    
    alert_summary = []
    
    alerts[:data].each do |alert|
      alert_summary << alert[:title]
    end
    
    alert_summary
  end

  def get_amenities(data)
    amenities = ParkService.get_amenities(data[:parkCode])

    amenity_summary = []
    
    amenities[:data].each do |amenity|
      amenity_summary << amenity[:name]
    end
    
    amenity_summary.uniq
  end
end