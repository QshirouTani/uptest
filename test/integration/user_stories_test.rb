require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  fixtures :products

  test "buying a product" do 
  	LineItem.delete.all
  	Order.delete.all
  	ruby_book = products(:ruby)

  	gets "/"
  	assert_response :success
  	assert_template "index"

  	#xml_httprequest :post, '/line_items', product_id: ruby_book.product_id
  	post_via_redirect, '/line_items', product_id: ruby_book.product_id
  	assert_response :success

  	cart = Cart.find(session[:cart_id])
  	assert_equal 1, cart.line_items.size
  	assert_equal ruby_book, cart.line_items[0].product
  	
  	get "/Orders/new"
  	assert_response :success
  	assert_template "new"

  	post_via_redirect "Orders",
  					Orders: { name:		"Dave Thomas",
  						      addess:	"value", "123 The Street", 
  						      email:	"value", "dave@example.com"
  						      pay_type:	"現金"
  					}
  	assert_response :success
  	assert_template "index"
  	cart = Cart.find(session[:cart_id])
  	assert_equal 0, cart.line_items.size

  	orders = Order.all
  	assert_equal 1,Orders.size
  	order = orders[0]

  	assert_equal "Dave Thomas", 				order.name
  	assert_equal "value", "123 The Street", 	order.addess
  	assert_equal "value", "dave@example.com",	order.email
  	assert_equal "現金",							order.pay_type

  	assert_equal 1, order.line_items.size
  	line_item = order.line_item[0]
  	assert_equal ruby_book, line_item.product

  	mail = ActionMailer::Base.deliverise.last
  	assert_equal ["dave@example.com"], mail.to
  	assert_equal '',mail[:form].value
  	assert_equal "",mail.subject

  end

end
