require "spec_helper"

describe Currency do

	describe '.exchange' do

		it 'should return the amount in dollar' do
	    Currency.exchange(500, "inr", "aud").should_not be_nil
	  end

  end

  describe '.exchange_rate' do

  	it "should return exchange rate of amount" do
	  	Currency.exchange_rate.should_not be_nil
    end

  end

  describe '.calculate' do

	  it "should return a calculated amount" do
	  	Currency.calculate(500).should_not be_nil
    end

	end

	describe 'Raise Errors' do

		it "raises error with unknown currency" do
      expect {  Currency.exchange(500, "xxx", "aud") }.to raise_error(StandardError, /xxx/)
    end

    it "raises error with unknown currency if any" do
      expect {  Currency.exchange(500, "inr", "yyy") }.to raise_error(StandardError, /yyy/)
    end

    it "raises error if valid amout is not present" do
      expect { Currency.calculate('xyz') }.to raise_error(StandardError, 'Could not find out the result')
    end

	end

end