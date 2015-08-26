class Merchant < ActiveRecord::Base

	def self.expensive_merchants
		where("avgprice >= 30")
	end

	def self.budget_merchants
		where("avgprice < 30")
	end

end
