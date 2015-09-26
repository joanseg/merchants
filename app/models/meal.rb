class Meal < ActiveRecord::Base
  belongs_to :merchant
  has_many :line_items

  	validates :body, length: { minimum: 10 }

	def self.recent_meals
		all.order( :created_at => :desc)
	end

end
