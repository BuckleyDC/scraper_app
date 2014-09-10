require 'open-uri'

class Download

	def initialize(short_link)
		@short_link = [short_link]
	end

	def dl
		@short_link.each do |link|  #only need partial urls here
			system("youtube-dl -o 'downloads/%(title)s' --no-playlist 'http://www.youtube.com#{link}'")
		end
	end
end

namespace :get_videos do
  desc "Pull stored video urls from db and do a youtube dump"
  task get_all: :environment do
  	@search_list = Video.all

	@search_list.each do |scan|
		@div_element = ""
		@page = []
		@page = Nokogiri::HTML(open(scan.library))
		@div_element = @page.css('div.yt-lockup-thumbnail a')[0]['href']
		@account_title = 
		
		p "working"

		if scan.first_download != @div_element

			latest_download = Video.find(scan.id)
			latest_download.first_download = @div_element
			latest_download.save
			
			x = Download.new(@div_element)
			x.dl
		else
			p "Nothing to see here."
		end
		
		puts Time.now
	end

	

  end

end
