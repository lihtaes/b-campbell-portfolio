class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent


protected

  def topics_for_sidebar
    @topics = Topic.with_blogs
  end
  
end