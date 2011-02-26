class WebsitePostsController < ApplicationController
  inherit_resources
  actions :index, :new, :create
  def create
    create! { website_posts_path }
  end  
end
