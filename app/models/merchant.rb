class Merchant < ActiveRecord::Base

	has_many :meals, dependent: :destroy
	has_many :orders

	validates :name, presence: true
	validates :body, length: { minimum: 10 }
	validates :avgprice, numericality: { greater_than_or_equal_to: 0 }
	validates :image_name, allow_blank: true, format: {
		with: /\w+\.(gif|jpg|png)\z/i,
		message: "must be a valid image (GIF; JPG or PNG)"
	}

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
