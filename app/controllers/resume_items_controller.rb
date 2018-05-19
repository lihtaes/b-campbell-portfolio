class ResumeItemsController < ApplicationController
  before_action :set_resume_item, only: [:edit, :update, :destroy]
  access all: {except: [:index, :destroy, :new, :create, :update, :edit, :show]}, site_admin: :all
  layout "blog"

  def index
    @resume_items = ResumeItem.all
    
  end

  def new
    @resume_item = ResumeItem.new 
  end

  def edit
  end

  def show
  end

  def create
    @resume_item = ResumeItem.new(resume_item_params)

    respond_to do |format|
      if @resume_item.save
        format.html { redirect_to resume_path, notice: 'Your resume item was submitted.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @resume_item.update(resume_item_params)
        format.html { redirect_to resume_path, notice: 'Resume item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @resume_item.destroy
    respond_to do |format|
      format.html { redirect_to resume_path, notice: 'Resume item was removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_item
      @resume_item = ResumeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_item_params
      params.require(:resume_item).permit(:title, :time_there, :tech_used, jobs_attributes: [:id, :task, :_destroy])
    end
end
