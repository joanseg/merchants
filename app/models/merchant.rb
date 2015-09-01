class Merchant < ActiveRecord::Base

	has_many :meals, dependent: :destroy

	validates :name, presence: true
	validates :body, length: { minimum: 10 }
	validates :avgprice, numericality: { equal_or_  }

	def self.expensive_merchants
		where("avgprice >= 30")
	end

	def self.budget_merchants
		where("avgprice < 30")
	end

	def self.order_logic
		all.order( :avgprice => :asc, :name => :asc)
	end

	def self.search_results(term)
		where("name like ?", "%#{term}%")
	end

end
