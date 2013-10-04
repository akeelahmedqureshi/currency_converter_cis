require 'rubygems'

def gemspec
  @gemspec ||= begin
    file = File.expand_path("../currency_converter_cis.gemspec", __FILE__)
    eval(File.read(file), binding, file)
  end
end
