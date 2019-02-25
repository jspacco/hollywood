class ActorsController < ApplicationController
    def index
        # actors#index
        # called when URL with with /actors receives HTTP GET
        # helper function to get this path is actors_path
        @actors = Actor.all
    end
    
    def create
        # actors@create
        # called when URL with /actors receives HTTP POST
        # helper function for the path is actors_path
        
        # creates an actor record as a LOCAL variable
        # params is created by Rails and is a hash that contains the key-value pairs
        # from the 
        
        actor = Actor.new(params.require(:actor).permit(:name))
 
        actor.save
        redirect_to action: :index
    end
    
    def show
       id = params[:id]
       @actor = Actor.find_by(id: id)
    end
end
