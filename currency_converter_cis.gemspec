Gem::Specification.new do |s|
  s.name        = 'currency_converter_cis'
  s.version     = '0.0.5'
  s.authors     = ["Akeel Qureshi, CISROR Team"]
  s.date        = '2013-10-04'
  s.description = "With the use to this gem , The two major issues will be solved the first one is to find out the various contry related details using either the contry code or the ip-address and the second one is to convert an amount from one currency to another, There are various scenarios where user has to show user locale related information based up on his/her ip-address So in those cases this gem will be really useful."
  s.summary     = "This gem caters the requirement to fetch the country related details based up on the ip-address or the country code. You can also convert an amount from one currency to another"
  s.homepage    = 'http://rubygems.org/gems/currency_converter_cis'

  s.add_dependency("nokogiri")
  s.add_dependency("geocoder")
  s.add_dependency("rspec-rails")
  s.files =  Dir.glob("{lib,spec}/**/*")
  s.files += %w(README.md)
  s.files += %w(currency_converter_cis.gemspec)
  s.require_path = "lib"
end

