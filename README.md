currency_converter_cis
======================

With the use to this gem , The two major issues will be solved the first one is to find out the various country related details using either the country code or the ip-address and the second one is to convert an amount from one currency to another, There are various scenarios where user has to show user locale related information based up on his/her ip-address So in those cases this gem will be really useful.

INSTALLTION

First thing you need to do is the installation , you can follow the below mentioned steps to install the gem inside your rails application.
You need to add sudo if you are not using rvm(ruby version manager)
<pre>
gem install currency_converter_CIS
</pre>

 
Add this following line in your Gemfile and then run bundle install. 
<pre>
gem 'currency_converter_CIS' 
</pre>



USAGE

Once you have installed this gem you can do the following :-

1) Country Code : "IN" is the contry code
<pre>
CurrencyConverterCis.country_by_code("IN")
</pre>
2) Ip-Address :
<pre>
CurrencyConverterCis.country_by_ip("xx.xx.xx.xx")
</pre>
3) Contry Converter : If you wanted to convert US dollars to Indian National Rupees here 1000 is the amount.
 <pre>
CurrencyConverterCis.exchange(1000, 'USD', 'INR')
</pre>