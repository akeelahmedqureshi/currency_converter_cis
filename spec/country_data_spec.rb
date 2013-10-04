require "spec_helper"

describe CountryData::Country do

  describe '.country_by_id' do

  	it "should return details of the country" do
	  	data = CountryData::Country.country_by_id("RD")
	  	data.should_not be_nil
    end

    it "should return nil if invalid country id passed" do
	  	data = CountryData::Country.country_by_id("xyz")
	  	data.should be_nil
    end

  end

  describe '.country_by_ip' do

  	it "should return details of the country" do
	  	data = CountryData::Country.country_by_ip("127.0.0.1")
	  	data.should_not be_nil
    end

  end

  describe '.all_currency' do

  	it "should return all currency details" do
	  	data = CountryData::Country.all_currency
	  	data.count.should eq(150)
    end

  end

end