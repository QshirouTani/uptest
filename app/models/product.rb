class Product < ActiveRecord::Base

	#空入力禁止チェックバリデーション
	validates :title, :description, :image_url, presence: true
	
end
