class ParkSerializer
  include JSONAPI::Serializer
  attributes :id,
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
end