module MerchantsHelper
	def format_body(merchant)
		if merchant.body && merchant.body.length != 0
			truncate(merchant.body, length: 30, separator: '')
		else
			content_tag(:i, 'no data')
		end
	end



	def show_image(merchant)
		image_tag(default_image(merchant), width: "250", height: "150")
	end

	private
	
	def default_image(merchant)
		if merchant.image_name.present?
			merchant.image_name
		else
			"default_image.png"
		end 
	end

end
