require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
	fixtures :products
	
	test "buying a product" do
		#Start by emptying
		LineItem.delete_all
		Order.delete_all
		ruby_book = products(:ruby)
		
		#User goes to store index page
		get "/"
		assert_response :success
		assert_template "index"
		
		#Select a product and add it to cart
		xml_http_request :post, '/line_items', product_id: ruby_book.id	#Test ajax
		assert_response :success
		
		cart = Cart.find(session[:cart_id])
		assert_equal 1, cart.line_items.size
		assert_equal ruby_book, cart.line_items[0].product
		
		#Check out
		get "/orders/new"
		assert_response :success
		assert_template "new"
		
		#Check order fields
		post_via_redirect "/orders",
						order: { name: "Dave Thomas",
								  address: "123 The Street",
								  email: "dave@example.com",
								  pay_type: "Check" }
		assert_response :success
		assert_template "index"
		cart = Cart.find(session[:cart_id])
		assert_equal 0, cart.line_items.size
		
		mail = ActionMailer::Base.deliveries.last
		assert_equal ["dave@example.com"], mail.to
		assert_equal 'Sam Ruby <depot@example.com>', mail[:from].value
		assert_equal "Everything Store Order Confirmation", mail.subject
	end
end
