Gem::Specification.new do |s|
  s.name        = 'currency_converter_CIS'
  s.version     = '0.0.1'
  s.date        = '2013-07-04'
  s.summary     = "This gem caters the requirement to fetch the country related details based up on the ip-address or the country code. You can also convert an amount from one currency to another"
  s.description = "With the use to this gem , The two major issues will be solved the first one is to find out the various contry related details using either the contry code or the ip-address and the second one is to convert an amount from one currency to another, There are various scenarios where user has to show user locale related information based up on his/her ip-address So in those cases this gem will be really useful."
  s.authors     = ["Akeel Qureshi"]
  s.email       = 'akeel.q@cisinlabs.com'
  s.files       = ['lib/currency_converter_cis.rb', 'lib/currencies_code.rb', 'lib/data/countries.yaml','lib/country_data.rb', 'lib/currency.rb', 'lib/geo_request.rb']
  s.add_dependency("geocoder")
  s.add_dependency("nokogiri")
  s.homepage    = 'http://rubygems.org/gems/currency_converter_cis'
end

