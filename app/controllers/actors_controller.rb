class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end
    
    def create
        @actor = Actor.new(params.require(:actor).permit(:name))
 
        @actor.save
        redirect_to action: :index
    end
    
    def show
       id = params[:id]
       @actor = Actor.find_by(id: id)
    end
end
