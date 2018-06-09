class PagesController < ApplicationController
  def home
    @posts = Blog.all

  end

  def about
    @instagram = SocialTool.instagram_search
    @skills = Skill.all
  end

  def resume
    @resume_items = ResumeItem.order("order")
  end

  def contact
    
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
