class User < ActiveRecord::Base
	after_destroy :ensure_an_admin_remains

private
	def ensure_an_admin_remains
		if User.count.zero?
			raise ''
		end

end
