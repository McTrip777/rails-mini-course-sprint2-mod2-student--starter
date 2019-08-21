class Order < ApplicationRecord  
    def ship
        shippable? && update(status: "shipped")
    end
    
    def shippable?
        status != "shipped" && products.count > 0
    end
    
    def products
        product_ids = OrderProduct.where(order_id: params[:id]).pluck(:product_id)
        Product.find(product_ids)
    end
end
