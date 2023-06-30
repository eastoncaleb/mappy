# app/services/google_maps_service.rb

class GoogleMapsService
  include HTTParty
  base_uri 'https://maps.googleapis.com/maps/api'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_directions(start_location, end_location)
    response = self.class.get('/directions/json', query: { origin: start_location, destination: end_location, key: @api_key })

    if response.success?
      parse_directions(response.parsed_response)
    else
      handle_error(response.code, response.message)
    end
  end

  private

  def parse_directions(response)
    distance = response['routes'][0]['legs'][0]['distance']['text']
    route = response['routes'][0]['overview_polyline']['points']
    travel_time = response['routes'][0]['legs'][0]['duration']['text']

    { distance: distance, route: route, travel_time: travel_time }
  end

  def handle_error(code, message)
    # Handle the error based on the code and message
    # You can log the error, raise an exception, or return an appropriate response
  end
end
