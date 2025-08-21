require 'net/http'
require 'json'
require 'uri'

# ==== CONFIGURE THESE ====
api_key = 'd498c968f70455388634d3d553008222'
  # Replace with your OpenWeatherMap API key
lat = 40.7608             # Latitude for Salt Lake City
lon = -111.8910           # Longitude for Salt Lake City
units = 'imperial'        # 'imperial' = °F, 'metric' = °C

# Build the URL
url = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{api_key}&units=#{units}")

# Fetch the data
response = Net::HTTP.get(url)

# Parse JSON
weather_data = JSON.parse(response)

# Print some key info
puts "City: #{weather_data['name']}"
puts "Temperature: #{weather_data['main']['temp']}°F"
puts "Weather: #{weather_data['weather'].first['description']}"
puts "Humidity: #{weather_data['main']['humidity']}%"
puts "Wind Speed: #{weather_data['wind']['speed']} mph"
