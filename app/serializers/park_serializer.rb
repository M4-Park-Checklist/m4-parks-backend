class ParkSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :designation, :description, :states, :media, :active_alerts, :things_to_do, :ammenities, :campgrounds, :events, :hours_of_operation, :weather
end