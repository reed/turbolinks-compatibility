module TitleHelper
	def title(filename)
		filename.split('/')[-1].split('.')[0].gsub(/_/, ' ').gsub(/\b('?[a-z])/){ $1.capitalize }
	end
end