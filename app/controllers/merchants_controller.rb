class MerchantsController < ApplicationController
	def index
		@merchants = Merchant.all.order(:name => :desc, :avgprice => :desc)
		@expensive_merchants = Merchant.expensive_merchants
		@budget_merchants = Merchant.budget_merchants
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

		merchant_params = params.require(:merchant).permit(:name, :body, :avgprice, :latitud, :longitud, :placeid)
		@merchant.update(merchant_params)

		redirect_to merchant_path(@merchant)
	end

	def new
		@merchant = Merchant.new
	end

	def create
		merchant_params = params.require(:merchant).permit(:name, :body, :avgprice, :latitud, :longitud, :placeid)
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
