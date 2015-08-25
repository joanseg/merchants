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

	def update
		merchant_id = params[:id]
		@merchant = Merchant.find(merchant_id)

		merchant_params = params.require(:merchant).permit(:name, :body, :avgprice)
		@merchant.update(merchant_params)

		redirect_to merchant_path(@merchant)
	end

	def new
		@merchant = Merchant.new
	end

	def create
		merchant_params = params.require(:merchant).permit(:name, :body)
		merchant = Merchant.create(merchant_params)
		redirect_to merchant_path(merchant)
	end

	def destroy
		merchant_id = params[:id]
		merchant = Merchant.find(merchant_id)
		merchant.destroy
		redirect_to merchants_url
	end

end
