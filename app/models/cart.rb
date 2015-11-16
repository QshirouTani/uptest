class Cart < ActiveRecord::Base
	has_meny :line_items, depedent: :destroy
end
