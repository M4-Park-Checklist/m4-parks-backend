class ParkSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :states, :media, :recent_news, :active_alerts, :things_to_do, :ammenities, :campgrounds, :events, :activities, :hours_of_operation, :weather
end