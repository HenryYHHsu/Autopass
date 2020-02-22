class OrdersController < ApplicationController

    skip_before_action :verify_authenticity_token
    def new
        @order = Order.new
    end

    def create
       
        

    end

    private
    def order_params
        params.require(:order).permit(:bill,
                :item,
                :qty,
                :storename)
    end
end
