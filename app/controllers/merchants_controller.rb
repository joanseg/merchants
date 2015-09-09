class MerchantsController < ApplicationController

  before_action :require_login, only: [:new, :edit, :update, :create, :destroy]

	def index
		@merchants = Merchant.order_logic
		@expensive_merchants = Merchant.expensive_merchants.order_logic
		@budget_merchants = Merchant.budget_merchants.order_logic
	end

	def search
		@merchants = Merchant.search_results(params[:q])
		if @merchants.length == 1
			@merchant = @merchants.first
			@meals = @merchant.meals
			@recent_meals = @merchant.meals.recent_meals
			render :show
		end
	end

	def show
		@merchant = Merchant.find(params[:id])
		@meals = @merchant.meals
		@recent_meals = @merchant.meals.recent_meals
	end

	def edit
		merchant_id = params[:id]
		@merchant = Merchant.find(merchant_id)
	end

	def update
		merchant_id = params[:id]
		@merchant = Merchant.find(merchant_id)
		@merchant.update(merchant_params)

		if(@merchant.save)
			flash[:notice] = "The merchant was updated"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check the form errors"
			render :edit
		end
	end

	def new
		@merchant = Merchant.new
	end

	def create
		
		@merchant = Merchant.new(merchant_params)

		if(@merchant.save)
			flash[:notice] = "The new merchant was created"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check form errors"
			render :new
		end
	end

	def destroy
		merchant_id = params[:id]
		merchant = Merchant.find(merchant_id)
		merchant.destroy
		flash[:notice] = "The merchant #{merchant.name} was deleted"
		redirect_to merchants_url
	end

	private

	def merchant_params()
		params.require(:merchant).permit(:name, :body, :avgprice, :latitud, :longitud, :placeid, :image_name)
	end


end
