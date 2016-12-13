class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :set_subject_count, :only => [:new, :create, :edit, :update]

  def index
    #logger.debug("*** Testing the logger. ***")
    @subjects = Subject.sorted
    #render('index') -> default
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new #({:name => 'Default'})
  end

  def create
    # Instantiate a new object using form params
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)  #resourceful route :)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')  # just re-renders form template,doesn't re-run new
      # form will be populated with submissions
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Instantiate an existing object using form params
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the subject's detail view
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))  #resourceful route :)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')  # just re-renders form template,doesn't re-run new
      # form will be populated with submissions
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)  #redirects to index page
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end

end
