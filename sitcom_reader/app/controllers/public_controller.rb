class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
  end

  def show
    @video = Video.where(:permalink => params[:permalink]).first
    if @video.nil?
      redirect_to(root_path)
    else
      uri = URI.parse(URI.encode(@video.embedUrl.strip))
      @embed_code = VideoEmbed.embed(uri)
      @scholars = @video.scholars.pluck('DISTINCT name')
      @featurees = @scholars.size != 1 ? @scholars[0] + " in conversation with Mary Dalton" : @scholars[0]
      # display play content using show.html.erb
    end
  end

  private

  def setup_navigation
    @videos = Video.sorted
  end

end
