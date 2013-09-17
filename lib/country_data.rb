require File.join(File.dirname(__FILE__), "geo_request.rb")
module CountryData

  class Country    
    def initialize(hashs={})
       hashs.each do |k,v|
          self.instance_variable_set("@#{k}", v)
          self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")}) 
          self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})  
       end
    end
    def self.country_by_id(str)        
      data = YAML.load(File.read(File.join(File.dirname(__FILE__), 'data', 'countries.yaml')).to_s)
      data[str].nil? ?  nil : self.new(data[str])        
    end

    def self.country_by_ip(ip) 
       self.country_by_id(GeoRequest.location(ip))          
    end

    def self.all_currency
      data = YAML.load(File.read(File.join(File.dirname(__FILE__), 'data', 'countries.yaml')).to_s)
      data.collect{|key,val| val['currency']}.uniq
    end
  end
  
end
