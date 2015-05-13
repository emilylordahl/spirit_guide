class Business < ActiveRecord::Base
	
	has_and_belongs_to_many :users

	def self.search(borough, term)
		p term
		p borough
		business_data = Yelp.client.search(borough, { term: term })
		
		businesses = business_data.businesses

		business_info = businesses.map do |biz|
			yelp_id = biz.id
			name = biz.name
			address = biz.location.display_address
			# phone_number = biz.display_phone
			website = biz.url
			rating = biz.rating 

		business = {
			yelp_id: yelp_id,
			name: name,
			address: address,
			# phone_number: phone_number,
			website: website,
			rating: rating
		}

		end

		p business_info

	end

	def self.biz_search(yelp_id)
		p yelp_id
		biz = Yelp.client.business(yelp_id)

		business = {
			name: biz.name,
			address: biz.location.display_address,
			phone_number: biz.display_phone,
			website: biz.url,
			rating: biz.rating
		}

		p business

	end

end