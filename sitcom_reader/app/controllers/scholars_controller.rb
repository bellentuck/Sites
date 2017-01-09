class ScholarsController < ApplicationController

  #layout 'admin'

  before_action :confirm_logged_in
  before_action :set_scholar_count, :only => [:new, :create, :edit, :update]

  def index
    @scholars = Scholar.sorted
  end

  def show
    @scholar = Scholar.find(params[:id])
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new(scholar_params)
    @videos = Video.where(:id => params[:featured_videos])
    @scholar.videos << @videos
    #associate the selected scholars to the video and create records in the join table
    if @scholar.save
      flash[:notice] = "Scholar record created successfully."
      redirect_to(scholars_path)
    else
      render('new')
    end
  end

  def edit
    @scholar = Scholar.find(params[:id])
  end

  def update
    @scholar = Scholar.find(params[:id])
    @videos = Video.where(:id => params[:featured_videos])
    @scholar.videos.destroy_all   #disassociate the already added videos (do we want this?)
    @scholar.videos << @videos
    #associate the selected videos to the scholar and create records in the join table
    if @scholar.update_attributes(scholar_params)
      flash[:notice] = "Scholar record updated successfully."
      redirect_to(scholars_path)
    else
      render('new')
    end
  end

  def delete
    @scholar = Scholar.find(params[:id])
  end

  def destroy
    @scholar = Scholar.find(params[:id])
    @scholar.destroy
    flash[:notice] = "Scholar '#{@scholar.name}' record destroyed successfully."
    redirect_to(scholars_path)
  end

  private

  def scholar_params
    params.require(:scholar).permit(:name, :jobTitle, :affiliation, :email, videos: [])
  end

  def set_scholar_count
    @scholar_count = Scholar.count
    if params[:action] == 'new' || params[:action] == 'create'
      @scholar_count += 1
    end
  end

end
