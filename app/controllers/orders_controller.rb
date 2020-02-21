class OrdersController < ApplicationController

    skip_before_action :verify_authenticity_token
    def new
        @order = Order.new
    end

    def create
        # @order = Order.new(order_params)
        # redirect_to new_order_path(@order), notice:'Create successful'
        # if @order.save
        #     flash[:notice]="新增假資料成功"
        #     redirect_to new_order_path(@order), notice:'Create successful'
        # else
        #     redirect_to new_order_path, notice:'Create fail'
        # end 
        puts "---------------------------------------"
    end

    private
    def order_params
        params.require(:order).permit(:bill,
                :item,
                :qty,
                :storename)
    end
end
