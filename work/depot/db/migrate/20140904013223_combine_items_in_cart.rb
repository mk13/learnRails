class CombineItemsInCart < ActiveRecord::Migration
	
	def up
		#replace multiple items of a single products in cart to a single one
		Cart.all.each do |cart|
			#count number of unique items and group them
			sums = cart.line_items.group(:product_id).sum(:quantity)
			
			sums.each do |product_id, quantity|
				if quantity > 1
					#Remove duplicate line_items
					cart.line_items.where(product_id: product_id).delete_all
					#Make a single new line_item
					item = cart.line_items.build(product_id: product_id)
					item.quantity = quantity
					item.save!
				end
			end
		end
	end
	
	def down
		#split items with quantity > 1 into multiple line_items
		LineItem.where("quantity>1").each do |line_item|
			#add individual items
			line_item.quantity.times do 
				LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, quantity: 1
			end
			
			#remove original item
			line_item.destroy
		end
	end
	
end
