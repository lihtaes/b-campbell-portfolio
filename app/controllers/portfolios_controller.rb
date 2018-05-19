class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, 
                                            :update, 
                                            :show, 
                                            :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end 
  
  def sort
    params[:order].each do |key, value|    
      Portfolio.friendly.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def new
    @portfolio_item = Portfolio.new
  end


  def create
      @portfolio_item = Portfolio.new(portfolio_params)
  
      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
        else
          format.html { render :new }
          end
      end
    end

  def edit
    
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
     
  end

  def destroy
    # Perform lookup
    @portfolio_item = Portfolio.find(params[:id])
    # Destroy/delete the record
    @portfolio_item.destroy
    # Redirect after record is destroyed/deleted
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Your portfolio item was successfully destroyed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle,
                                      :link, 
                                      :body, 
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]

                                      )
  end       

end

  def set_portfolio_item
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end































