class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	attr_accessor :line_items
	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]
	
	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil	#States item no longer belongs to cart
			line_items << item	#moves item to order's model
		end
	end
end