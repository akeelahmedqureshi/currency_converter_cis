require "spec_helper"

describe GeoRequest do

	describe '.location' do

		it "should return location details as per the ip" do
	  	GeoRequest.location("127.0.0.1").should_not be_nil
    end

	end

end