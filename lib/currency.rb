module Currency
  
  # CURRENCIES  = {:dzd => "Algerian Dinar",:ars => "Argentine Peso",:amd => "Armenian Dram",:aud => "Australian Dollar",:bsd => "Bahamian Dollar",:bhd => "Bahraini Dinar",:bdt => "Bangladeshi Taka",:bbd => "Barbados Dollar",:byr => "Belarusian Ruble",:bzd => "Belize Dollar",:bmd => "Bermudian Dollar",:bob => "Bolivian Boliviano",:bwp => "Botswana Pula",:brl => "Brazilian Real",:gbp => "British Pound",:bnd => "Brunei Dollar",:bgn => "Bulgarian Lev",:bif => "Burundi Franc",:khr => "Cambodian Riel",:cad => "Canadian Dollar",:cve => "Cape Verde Escudo",:kyd => "Cayman Islands Dollar",:xof => "CFA BCEAO Franc",:xaf => "CFA BEAC Franc",:xpf => "CFP Franc",:clp => "Chilean Peso",:cny => "Chinese Yuan Renminbi",:cop => "Colombian Peso",:crc => "Costa Rican Colon",:hrk => "Croatian Kuna",:cup => "Cuban Peso",:czk => "Czech Koruna",:dkk => "Danish Krone",:djf => "Djibouti Franc",:dop => "Dominican Peso",:xcd => "East Caribbean Dollar",:egp => "Egyptian Pound",:eek => "Estonian Kroon",:etb => "Ethiopian Birr",:eur => "Euro",:fjd => "Fiji Dollar",:gmd => "Gambian Dalasi",:ghs => "Ghanaian Cedi",:gtq => "Guatemalan Quetzal",:htg => "Haitian Gourde",:hnl => "Honduran Lempira",:hkd => "Hong Kong Dollar",:huf => "Hungarian Forint",:isk => "Iceland Krona",:inr => "Indian Rupee",:idr => "Indonesian Rupiah",:irr => "Iranian Rial",:iqd => "Iraqi Dinar",:ils => "Israeli New Shekel",:jmd => "Jamaican Dollar",:jpy => "Japanese Yen",:jod => "Jordanian Dinar",:kzt => "Kazakhstan Tenge",:kes => "Kenyan Shilling",:krw => "Korean Won",:kwd => "Kuwaiti Dinar",:lak => "Lao Kip",:lvl => "Latvian Lats",:lbp => "Lebanese Pound",:lsl => "Lesotho Loti",:lyd => "Libyan Dinar",:ltl => "Lithuanian Litas",:mop => "Macau Pataca",:mwk => "Malawi Kwacha",:myr => "Malaysian Ringgit",:mur => "Mauritius Rupee",:mxn => "Mexican Peso",:mdl => "Moldovan Leu",:mad => "Moroccan Dirham",:mmk => "Myanmar Kyat",:npr => "Nepalese Rupee",:ang => "Netherlands Antillian Guilder",:nzd => "New Zealand Dollar",:nio => "Nicaraguan Cordoba Oro",:ngn => "Nigerian Naira",:nok => "Norwegian Krone",:omr => "Omani Rial",:pkr => "Pakistan Rupee",:pab => "Panamanian Balboa",:pyg => "Paraguay Guarani",:pen => "Peruvian Nuevo Sol",:php => "Philippine Peso",:pln => "Polish Zloty",:qar => "Qatari Rial",:ron => "Romanian Leu",:rub => "Russian Ruble",:rwf => "Rwanda Franc",:sar => "Saudi Riyal",:rsd => "Serbian Dinar",:scr => "Seychelles Rupee",:sgd => "Singapore Dollar",:sos => "Somali Shilling",:zar => "South African Rand",:lkr => "Sri Lanka Rupee",:sdd => "Sudanese Dinar",:szl => "Swaziland Lilangeni",:sek => "Swedish Krona",:chf => "Swiss Franc",:syp => "Syrian Pound",:twd => "Taiwan Dollar",:tzs => "Tanzanian Shilling",:thb => "Thai Baht",:ttd => "Trinidad and Tobago Dollar",:tnd => "Tunisian Dinar",:try => "Turkish Lira",:ugx => "Uganda Shilling",:uah => "Ukraine Hryvnia",:aed => "United Arab Emirates Dirham",:uyu => "Uruguay Peso",:usd => "US Dollar",:vef => "Venezuelan Bolivar",:vnd => "Vietnamese Dong",:zmk => "Zambian Kwacha",:zwd => "Zimbabwe Dollar"}
  URL = "http://exchange-rates.org/converter"
  def self.exchange(money, from, to)      
    @from_currency = from.downcase.to_sym
    @to_currency = to.downcase.to_sym

    raise StandardError, "From currency #{@from_currency} is invalid" unless self.from_currency_is_valid?
    raise StandardError, "To currency #{@to_currency} is invalid" unless self.to_currency_is_valid?

    self.calculate(money)
  end

  def self.calculate(money)      
    ex_rate = exchange_rate
    raise StandardError, "Could not find out the result" if ex_rate.nil?
    
    result = "%.2f" % (ex_rate * money)
    result.to_f
  end

  def self.exchange_rate
    begin
      doc = Nokogiri::HTML(open(url), nil, 'UTF-8')
      doc.css('#ctl00_M_lblToAmount').text.to_f
    rescue 
      nil
    end
  end  

  def self.url
    "#{URL}/#{@from_currency.to_s.upcase}/#{@to_currency.to_s.upcase}/1"
  end   


  private   

   def self.from_currency_is_valid?
     CurrencyCode::CURRENCIES.has_key?(@from_currency)
   end

   def self.to_currency_is_valid?
     CurrencyCode::CURRENCIES.has_key?(@to_currency)
   end
end