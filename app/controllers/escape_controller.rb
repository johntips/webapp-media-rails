class EscapeController < ApplicationController
    def index
      @escapes = Escapes.order(time: :desc).where('open_flag = ?', 1).paginate(:page => params[:page],:per_page => 3)
      logger.debug(@escapess)
    end

    def show
      @id = params[:id]
      @detail_escape =Escapes.where('id = ?',@id)
    end
end
