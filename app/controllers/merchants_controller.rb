class MerchantsController < ApplicationController
	def index
		@merchants = Merchant.order_logic
		@expensive_merchants = Merchant.expensive_merchants.order_logic
		@budget_merchants = Merchant.budget_merchants.order_logic
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

		@merchant.update(merchant_params)

		redirect_to merchant_path(@merchant)
	end

	def new
		@merchant = Merchant.new
	end

	def create
		merchant = Merchant.create(merchant_params())
		redirect_to merchant_path(merchant)
	end

	def destroy
		merchant_id = params[:id]
		merchant = Merchant.find(merchant_id)
		merchant.destroy
		redirect_to merchants_url
	end

	private

	def merchant_params()
		params.require(:merchant).permit(:name, :body, :avgprice, :latitud, :longitud, :placeid, :image_name)
	end

end
