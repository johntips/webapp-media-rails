class TimelineController < ApplicationController
  def index
    @timeline = Post.paginate(:page => params[:page], :per_page => 20)
    debug @timeline
  end
end
