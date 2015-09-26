class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :merchant
  has_many :line_items
end
