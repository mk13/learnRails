class StoreController < ApplicationController
	skip_before_filter :authorize
	def index
		@products = Product.order(:title)
		@time = Time.now
		@cart = current_cart
		increment_counter
	end
end
