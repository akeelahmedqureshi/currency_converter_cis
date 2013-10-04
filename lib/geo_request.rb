 module GeoRequest
    def self.location(ip)
      loc = Geocoder.search(ip).first
      return loc.country_code
    end 
 end