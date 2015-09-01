class MealsController < ApplicationController
	
	def index
		@merchant = Merchant.find(params[:merchant_id])
	end 

	def new
		@merchant = Merchant.find(params[:merchant_id])
		@meal = @merchant.meals.new
	end

	def create
		@merchant = Merchant.find(params[:merchant_id])
		@meal = @merchant.meals.new(meal_params)
		@merchant.save
		redirect_to merchant_path(@merchant)
	end

	private

	def meal_params
		params.require(:meal).permit(:body)
	end
end