module MerchantsHelper
	def format_body(merchant)
		if merchant.body && merchant.body.length != 0
			truncate(merchant.body, length: 30, separator: '')
		else
			content_tag(:i, 'no data')
		end
	end
end
