class Dropbox

	DOWNLOAD_FLAG = '?dl=1'

	def initialize uri
		@uri = uri
	end


	def files
		doc = Nokogiri::HTML(open @uri)

		doc.xpath('//a[@class="filename-link"]').map do |a| {
			:name => URI.decode(File.basename(a.attribute('href').value)), 
			:url => a.attribute('href').value + DOWNLOAD_FLAG 
		}
		end

	end

end