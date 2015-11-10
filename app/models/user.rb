# require_dependency 'app/validators/email_validator.rb'
class EmailValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)
		unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	  	record.errors[attribute] << (options[:message] || "is not an email")
		end
	end

end

class User < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	before_save :downcase_email
	belongs_to :merchant

	validates :name, presence: true, length: { maximum:50 }
	validates :email, presence: true, length: { maximum: 200 }
	validates :email, email: true
	validates :email, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 5 }

	has_secure_password

	def current_order(merchant_id)
		orders.where(:sent_date => nil, :merchant_id => merchant_id).first
	end

	def current_orders
		orders.where(:sent_date => nil)
	end


	private

	def downcase_email
		self.email = email.downcase
	end
end
