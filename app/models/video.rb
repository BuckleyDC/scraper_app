class Video < ActiveRecord::Base
	validates :title, :library, presence: true

	# attr_accessor :search_list, :url_pair, :div_element, :page

	def self.get_url
	end


end
