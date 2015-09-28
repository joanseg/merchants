class OrdersController < ApplicationController 
	include SessionsHelper
	before_action :set_user


	def create
		@merchant = Merchant.find(params[:merchant_id])
		@order = current_user.current_order(@merchant.id) #@merchant.orders.find_by(:user_id => current_user.id)
		
		if @order
			@order.other_amount = params[:order[:other_amount]]
			# to be added meals lineItems
		else
			@order = @merchant.orders.new(order_params)
			@order.user = current_user
		end

		if @order.save
			flash[:notice] = "item added"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check form errors"
			render :new
		end
	end

	def update
		@merchant = Merchant.find(params[:merchant_id])
		@order = current_user.current_order(@merchant.id) #@merchant.orders.find(params[:id])
		@order.update(order_params)

		if(@order.save)
			flash[:notice] = "The order was updated"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check the form errors"
			render merchant_path(@merchant) # to be checked
		end
	end

	def send_order
		order = Order.find(params[:id])
		order.sent_date = DateTime.now
		order.save
		redirect_to user_path(current_user.id)
	end

	def accept_order
		order.accepted_date = DateTime.now
		order.save
		redirect_to user_path(current_user.id)
	end

	private

	def order_params
		params.require(:order).permit(:other_amount)
	end

	def set_user
		@user = current_user
	end
end
