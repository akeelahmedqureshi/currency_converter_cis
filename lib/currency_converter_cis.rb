require 'geocoder'
require 'nokogiri'
require 'open-uri'
require 'yaml'
require File.join(File.dirname(__FILE__), "currencies_code.rb")
require File.join(File.dirname(__FILE__), "country_data.rb")
require File.join(File.dirname(__FILE__), "currency.rb")
module CurrencyConverterCis  

  def self.country_by_code(str)        
    CountryData::Country.country_by_id(str)    
  end

  def self.country_by_ip(str)        
    CountryData::Country.country_by_ip(str)    
  end

  def self.exchange(money, from, to)     
    Currency.exchange(money, from, to)     
  end

end





