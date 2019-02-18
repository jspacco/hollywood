class DirectorsController < ApplicationController
    def index
        @directors = Director.all
    end
    
    def create
        director = Director.new(params.require(:director).permit(:name))
 
        director.save
        redirect_to action: :index
    end
    
    def show
       id = params[:id]
       @director = Director.find_by(id: id)
    end
end
