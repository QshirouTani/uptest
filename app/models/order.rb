class Order < ActiveRecord::Base
	PAYMENT_TYPES = ["現金","クレジットカード","銀行振り込み"]

	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	has_many :line_items, dependent: :destroy

	def add_line_items_form_cart(cart)
		cart.line_items.each{|item|
			item.cart_id = nil
			line_items << item
		}
	end

end
