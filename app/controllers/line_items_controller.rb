class LineItemsController < ApplicationController

	def create
		@order = Order.find(params[:order_id])
		meal = Meal.find(params[:line_item][:meal_id])
		@line_item = LineItem.where({order_id: @order.id, meal_id: meal.id}).first

		if @line_item
			@line_item.quantity += params[:line_item][:quantity].to_i
		else			
			@line_item = @order.line_items.new(line_item_params)
			@line_item.item_price = meal.price
			@line_item.meal = meal
		end

		if(@line_item.save)
			flash[:notice] = "The meal was added"
			redirect_to merchant_path(@order.merchant)
		else
			flash[:notice] = "Please check form errors"
			render :new
		end
	end

	private

	def line_item_params()
		params.require(:line_item).permit(:quantity)
	end
end
