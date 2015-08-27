class Meal < ActiveRecord::Base
  belongs_to :merchant

	def self.recent_meals
		all.order( :created_at => :desc)
	end


end
