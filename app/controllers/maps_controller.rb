class MapsController < ApplicationController
  

  def index
    @api_key = "AIzaSyCwdTm2xiTCPxTGZr_O7HsvVaQb8nKrS3o"
    location = Geocoder.search("73.169.17.36").first.data
    @location ={ zipcode: location['zip_code'], latitude: location['latitude'], longitude: location['longitude']}
  end
end