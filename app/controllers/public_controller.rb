class PublicController < ApplicationController
  layout 'public'
  
  before_action :set_up_navigation
  
  def index
  end

  def show
    @page = Page.visible.where(permalink: params[:permalink]).first
    redirect_to root_path if @page.nil?
  end
  
  private
  
  def set_up_navigation
    @subjects = Subject.visible.sorted
  end
end
