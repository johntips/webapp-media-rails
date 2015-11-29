class EscapeController < ApplicationController
    def index
      @escapes = Escapes.paginate(:page => params[:page])
      logger.debug(@escapess)
    end
end
