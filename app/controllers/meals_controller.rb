class MealsController < ApplicationController

before_action :require_login, only: [ :new, :create ]	
before_action :set_question
	
	def index
		@meals = @merchant.meals
	end 

	def new
		@meal = @merchant.meals.new
	end

	def create
		@meal = @merchant.meals.new(meal_params)
		@merchant.save
		redirect_to merchant_path(@merchant)
	end

	private

	def meal_params
		params.require(:meal).permit(:body)
	end

	def set_question
		@merchant = Merchant.find(params[:merchant_id])
	end
end