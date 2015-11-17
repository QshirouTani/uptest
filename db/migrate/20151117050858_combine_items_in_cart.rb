class CombineItemsInCart < ActiveRecord::Migration
  def change
  end

  def down
  	LineItem.where("quantity>1").each{|line_item|
  		line_item.quantity.times{
  			LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, quantity: 1
  		}
  		line_item.destroy
  	}
  end
end
