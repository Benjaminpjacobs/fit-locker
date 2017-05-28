class MapsController < ApplicationController
  

  def index
    ip = request.remote_ip
    ip_location = check_ip(ip)
    @location ={ zipcode: ip_location['zip_code'], latitude: ip_location['latitude'], longitude: ip_location['longitude']}
    @api_key = "AIzaSyCwdTm2xiTCPxTGZr_O7HsvVaQb8nKrS3o"
  end

  private

    def check_ip(ip)
      if Geocoder.search("#{ip}").first.data["zip_code"].nil?
        Geocoder.search("73.169.17.36").first.data
      else
        Geocoder.search("#{ip}").first.data
      end
    end
end