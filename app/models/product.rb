class Product < ActiveRecord::Base

	#空入力禁止チェックバリデーション
	validates :title, :description, :image_url, presence: true

	has_many :line_items

	before_destroy :ensure_not_refernced_by_ant_line_item
	

	private
		def ensure_not_refernced_by_ant_line_item
			if line_itms.empty?
				return true
			else
				errors.add(:base, '品目が存在します')
				return false
			end
			
		end


end
