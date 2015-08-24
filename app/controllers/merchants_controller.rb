class MerchantsController < ApplicationController
	def index
		@merchants = Merchant.all
	end

	def show
		@merchant = Merchant.find(params[:id])
	end

	def edit
		merchant_id = params[:id]
		@merchant = Merchant.find(merchant_id)
	end
end
