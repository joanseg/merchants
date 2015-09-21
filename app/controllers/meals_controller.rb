class MealsController < ApplicationController

before_action :require_login, only: [ :new, :create ]	
before_action :set_question
	
	def index
		@meals = @merchant.meals
	end 

	def show
 		@meal = @merchant.meals.find(params[:id])
 	end

	def new
		@meal = @merchant.meals.new
	end

	def create
		@meal = @merchant.meals.new(meal_params)
		
		if @merchant.save
			flash[:notice] = "The new meal was created"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check form errors"
			render :new
		end
	end

	def edit
		meal_id = params[:id]
		@meal = Meal.find(meal_id)
	end

	def update
		meal_id = params[:id]
		@meal = Meal.find(meal_id)

		meal_params = params.require(:meal).permit(:body, :price, :image_name)
		@meal.update(meal_params) 

		if(@meal.save)
			flash[:notice] = "Meal has been updated"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check form errors"
			render :edit
		end
	end

	private

	def meal_params
		params.require(:meal).permit(:body, :price, :image_name)
	end

	def set_question
		@merchant = Merchant.find(params[:merchant_id])
	end
end