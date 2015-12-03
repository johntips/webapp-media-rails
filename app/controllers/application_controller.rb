class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Jpmobile::ViewSelector
  before_filter :set_view_path
  before_filter :set_menu_url

  private
  def set_view_path
    path =  request.smart_phone? ? 'smartphone' : 'pc'
    prepend_view_path(Rails.root + 'app/views' + path)
    logger.debug(path)
  end

  def set_menu_url

   @url = request.path
    case @url

      when   /collection/
        puts "match"
        @menu_img_collection = 'collection-pink.png'
        @menu_img_timeline = 'timeline.png'
        @menu_img_muse = 'muse.png'

      when    /timeline/
        @menu_img_timeline = 'timeline-pink.png'
        @menu_img_collection = 'collection.png'
        @menu_img_muse = 'muse.png'

      when   /muse/
        @menu_img_muse = 'muse-pink.png'
        @menu_img_collection = 'collection.png'
        @menu_img_timeline = 'collection.png'

      else
        @menu_img_muse = 'muse.png'
        @menu_img_collection = 'collection.png'
        @menu_img_timeline = 'timeline-pink.png'
    end

  end

end
