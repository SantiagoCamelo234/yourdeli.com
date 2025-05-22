class Admin::OrdersController < ApplicationController
    class Admin::OrdersController < ApplicationController
        before_action :set_order, only: [:show, :update]
      
        def index
          @orders = Order.all.order(created_at: :desc)
        end
      
        def show
        end
      
        def update
          if @order.update(order_params)
            redirect_to admin_order_path(@order), notice: "Estado actualizado correctamente."
          else
            render :show, alert: "Error al actualizar el estado."
          end
        end
      
        private
      
        def set_order
          @order = Order.find(params[:id])
        end
      
        def order_params
          params.require(:order).permit(:status)
        end
      end
      
end
