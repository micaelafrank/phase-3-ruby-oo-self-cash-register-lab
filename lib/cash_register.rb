# 100.class returns Integer while 100.0.class returns Float

class CashRegister
    attr_accessor :total, :discount, :last_purchase, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_purchase = price * quantity
        self.total += self.last_purchase
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            discount_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_purchase
    end
end 

purchase = CashRegister.new(20)
purchase.total
purchase.add_item("sugar", 2.50, 4)
purchase.apply_discount
