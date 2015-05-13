class Market < ActiveRecord::Base
	
	has_and_belongs_to_many :users

	BASE_URL = 'https://data.cityofnewyork.us/resource/cdpt-29ur.json?borough='

	def self.search_borough(borough)
		p borough
		capped_borough = borough.titleize
		p capped_borough

		url = BASE_URL + URI.escape(capped_borough)
		p url
		market_data = HTTParty.get(url)

		markets = market_data.map do |market|
			borough = market['borough']
			days_open = market['day_s']
			hours = market['hours']
			name = market['market_name']
			address = market['street_address']

		market = {
			name: name,
			days_open: days_open,
			hours: hours,
			borough: borough,
			address: address
		}
			
		end

		p markets

	end

end
