class CollectionController < ApplicationController
  def index
    @collection = Collections.order(end_date: :desc).where('open_flag = ?', 1).paginate(:page => params[:page],:per_page => 3)

  end

  def show
    @id = params[:id]
    @detail_collection =Collections.where('id = ? ',@id)
  end
end
