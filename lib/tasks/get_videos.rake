namespace :get_videos do
  desc "Pull stored video urls from db and do a youtube dump"
  task get_all: :environment do
  	@search_list = Video.all
	@url_pair = [nil,nil]
	@div_element = ""
	@page = {}
	@search_list.each do |scan|
		@page = Nokogiri::HTML(open(scan.library))
		@div_element = page.css('div.yt-lockup-thumbnail a')[0]['href']
	end

	@url_pair.pop
	@url_pair.unshift(@div_element)
	p "working"
	# sleep 10

	if @url_pair[0] != @url_pair[1]
		x = Download.new(@url_pair[0])
		x.dl
	else
		p "Nothing to see here."
	end
	puts "========================================================================================================="
	p @url_pair
	# sleep 15
  end

end
