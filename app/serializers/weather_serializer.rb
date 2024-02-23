class WeatherSerializer
  include JSONAPI::Serializer
  attributes :id,
             :forecast
end