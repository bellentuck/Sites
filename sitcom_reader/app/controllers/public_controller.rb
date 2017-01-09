class PublicController < ApplicationController

  layout 'public'

  def index
    @videos = Video.sorted
  end

  def show
    @video = Video.where(:permalink => params[:permalink]).first
    if @video.nil?
      redirect_to(root_path)
    else
      uri = URI.parse(URI.encode(@video.embedUrl.strip))
      @embed_code = VideoEmbed.embed(uri)
      @scholars = @video.scholars.pluck('DISTINCT name')
      # @featurees = @scholars.size != 1 ? @scholars[0] + " in conversation with Mary Dalton" : @scholars[0]
      # display play content using show.html.erb
    end
  end

  def author_interviews
    @videos_culture_sitcom = Video.category_search("Author Interviews")
    # Video.find(course_filter("Culture and the Sitcom"))
    #  Video.category_search("Culture and the Sitcom")
  end

  def course_lectures
    @videos_com_318 =
    Video.category_search("Course Lectures")
    #Video.category_search("COM 318 Videos")
  end

  def critical_media_studies_book
    # page about Critical Media Studies Student Essays on Contemporary Sitcoms
  end

  def about
    # about page
  end

  #private
  #
  # def course_filter(filter)
  #   if filter
  #     where(courseCategory: filter)
  #   end
  # end

end
