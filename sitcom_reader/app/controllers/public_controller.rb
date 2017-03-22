class PublicController < ApplicationController

  layout 'public'

  def index
    @videos = Video.sorted
    # @videos = Video.category_search("Author Interviews").visible.book_order
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
    @videos = Video.category_search("Author Interviews").visible.book_order
    # #getting rid of this page
    # #@videos_culture_sitcom = Video.category_search("Author Interviews")
    # # Video.find(course_filter("Culture and the Sitcom"))
    # #  Video.category_search("Culture and the Sitcom")
    # #for now, to test:
    # decades = Hash.new()
    # decades["The 1950s"] = Video.decade_search("The 1950s").book_order
    # decades["The 1960s"] = Video.decade_search("The 1960s").book_order
    # decades["The 1970s"] = Video.decade_search("The 1970s").book_order
    # decades["The 1980s"] = Video.decade_search("The 1980s").book_order
    # decades["The 1990s"] = Video.decade_search("The 1990s").book_order
    # decades["The 2000s"] = Video.decade_search("The 2000s").book_order
    # decades["The 2010s"] = Video.decade_search("The 2010s").book_order
    # @decades = decades
    # # @decades = [
    # #   { "1950s": Video.decade_search("The 1950s").book_order },
    # #   { "1960s": Video.decade_search("The 1960s").book_order },
    # #   { "1970s": Video.decade_search("The 1970s").book_order },
    # #   { "1980s": Video.decade_search("The 1980s").book_order },
    # #   { "1990s": Video.decade_search("The 1990s").book_order },
    # #   { "2000s": Video.decade_search("The 2000s").book_order },
    # #   { "2010s": Video.decade_search("The 2010s").book_order }
    # # ]
    # # @the1950s = Video.decade_search("The 1950s").book_order
    # # @the1960s = Video.decade_search("The 1960s").book_order
    # # @the1970s = Video.decade_search("The 1970s").book_order
    # # @the1980s = Video.decade_search("The 1980s").book_order
    # # @the1990s = Video.decade_search("The 1990s").book_order
    # # @the2000s = Video.decade_search("The 2000s").book_order
    # # @the2010s = Video.decade_search("The 2010s").book_order
    # @intro_vids =
    #   Video.title_search("Laura Linder: Introduction to the Sitcom Reader") + Video.title_search("Laura Linder: Conclusion: The Evolving, Resilient Sitcom: Sitcoms are Not Dead!")
  end

  def course_lectures
    @videos_com_318 =
    Video.category_search("Course Lectures").visible
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
