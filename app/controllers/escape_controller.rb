class EscapeController < ApplicationController
    def index
      @escapes = Escapes.order(time: :desc).paginate(:page => params[:page],:per_page => 3)
      logger.debug(@escapess)
    end
end
