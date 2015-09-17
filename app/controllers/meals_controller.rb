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

	def edit
		meal_id = params[:id]
		@meal = Meal.find(meal_id)
	end

	def update
		meal_id = params[:id]
		@meal = Meal.find(meal_id)

		meal_params = params.require(:meal).permit(:body, :price)
		@meal.update(meal_params)

		redirect_to merchants_path(@merchant)
	end

	private

	def meal_params
		params.require(:meal).permit(:body, :price)
	end

	def set_question
		@merchant = Merchant.find(params[:merchant_id])
	end
end