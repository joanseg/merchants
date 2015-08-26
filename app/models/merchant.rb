class Merchant < ActiveRecord::Base

	def self.expensive_merchants
		where("avgprice >= 30")
	end

	def self.budget_merchants
		where("avgprice < 30")
	end

	def self.order_logic
		all.order( :avgprice => :asc, :name => :asc)
	end

end
