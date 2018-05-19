module SetSource
  extend ActiveSupport::Concern


  #Working with session variables, only when someone comes from target links, the output for which
#can be seen in the application.html.erb file which is located in views/layouts/HERE
  included do
    before_filter :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end