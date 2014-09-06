class StoreController < ApplicationController
	def index
		@products = Product.order(:title)
		@time = Time.now
		@cart = current_cart
		increment_counter
	end
end
