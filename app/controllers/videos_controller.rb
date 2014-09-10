class VideosController < ApplicationController

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)

		if @video.save
			redirect_to @video
		else
			render 'new'
		end
	end

	def show
		@video = Video.find(params[:id])
	end

	def index
		@videos = Video.all
	end

	def destroy
		@videos = Video.find(params[:id])
		@videos.destroy

		redirect_to videos_path
	end

	private

	def video_params
		params.require(:video).permit(:title,:library)
	end

end
