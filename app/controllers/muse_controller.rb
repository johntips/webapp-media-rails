class MuseController < ApplicationController
  def index
    @muse = Users.where.not(thumb_image_file: "").where(is_muse: 1).order(img_count: :desc).paginate(:page => params[:page],:per_page => 4)
    logger.debug(@muse)
  end

  def show
    @id = params[:id]
    @detail_muse =Users.where('id = ?',@id)
  end
end
