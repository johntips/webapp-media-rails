class MuseController < ApplicationController
  def index
    @muse = Users.order(time: :desc).paginate(:page => params[:page],:per_page => 4)
    logger.debug(@escapess)
  end

  def show
    @id = params[:id]
    @detail_muse =Users.where('id = ?',@id)
  end
end
