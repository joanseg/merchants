class OrdersController < ApplicationController 
	include SessionsHelper
	before_action :set_user


	def create
		@merchant = Merchant.find(params[:merchant_id])
		@order = @merchant.orders.new(order_params)
		@order.user = @user

		if @merchant.save
			flash[:notice] = "Amount added"
			redirect_to merchant_path(@merchant)
		else
			flash[:notice] = "Please check form errors"
			render :new
		end
	end


	private

	def order_params
		params.require(:order).permit(:other_amount)
	end

	def set_user
		@user = current_user
	end
end
