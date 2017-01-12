class VideosController < ApplicationController

  #layout 'admin'

  before_action :confirm_logged_in
  before_action :set_video_count, :only => [:new, :create, :edit, :update]

  def index
    @videos = Video.sorted
  end

  def show
    @video = Video.find(params[:id])
    #@embed_code = %Q{<iframe src=#{@video.embedUrl}></iframe>}.html_safe
    #@embed_code = %Q{#{@video.embedUrl}}.html_safe
    uri = URI.parse(URI.encode(@video.embedUrl.strip))
    @embed_code = VideoEmbed.embed(uri)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @scholars = Scholar.where(:id => params[:featured_scholars])
    @video.scholars << @scholars
    #associate the selected scholars to the video and create records in the join table
    if @video.save
      flash[:notice] = "Video record created successfully."
      redirect_to(videos_path)
    else
      render('new')
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @scholars = Scholar.where(:id => params[:featured_scholars])
    @video.scholars.destroy_all   #disassociate the already added scholars (do we want this?)
    @video.scholars << @scholars
    #associate the selected scholars to the video and create records in the join table
    if @video.update_attributes(video_params)
      flash[:notice] = "Video record updated successfully."
      redirect_to(videos_path)
    else
      render('new')
    end
  end

  def delete
    @video = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Video '#{@video.headline}' record destroyed successfully."
    redirect_to(videos_path)
  end

  private

  def video_params
    params.require(:video).permit(:embedUrl, :headline, :caption, :transcript, :bookChapter, :bookSection, :courseCategory, scholars: [])
    # Ultimately would like to get some regexes in here to be able to insert
    #  a whole Vimeo codeblock and auto-break it up.
  end

  def set_video_count
    @video_count = Video.count
    if params[:action] == 'new' || params[:action] == 'create'
      @video_count += 1
    end
  end

end
