class Merchant < ActiveRecord::Base

	has_many :meals, dependent: :destroy

	def self.expensive_merchants
		where("avgprice >= 30")
	end

	def self.budget_merchants
		where("avgprice < 30")
	end

	def self.order_logic
		all.order( :avgprice => :asc, :name => :asc)
	end

	def self.search_results
		where("name like ?", "%#{:q}%")
	end

end
