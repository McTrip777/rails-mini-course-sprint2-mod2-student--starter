class CheckOrder
    def initialize
        @order = order
        @products = order.products
    end
    def ship
        return false unless available?

        @products.each {|product| product.reduce_inventory}
        @order.ship
    end
    def available?
        @products.all? {|product| product.available_items?}
    end
end