module ApplicationHelper
	def show_image(holder)
		image_tag(default_image(holder),  height: "200")
	end

	private

	def default_image(holder)
		if holder.image_name.present?
			holder.image_name
		else
			"default_image.png"
		end 
	end
end
