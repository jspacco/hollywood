class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def new
        @directors = Director.all
    end
    
    def create
        # require/permit lets us make sure that we are in control of the fields we are
        # using from users to make DB queries.
        # Remember the dangers of Bobby Tables!
        # https://xkcd.com/327/
        movie = Movie.new(params.require(:movie).permit(:title, :year, :director_id))
        
        puts movie.title
        puts movie.year
        
        # Look up the director and set to the director of the movie
        # This is kind of weird. The movies table has a foreign key reference
        # to the directors table. So we are using the director_id that's in
        # the form to look up the actual director record. We can set this to a
        # director variable that looks like it's inside the movie table.
        # movie.director = Director.find_by(params[:director_id])
 
        movie.save
        
        puts movie.errors.full_messages
        
        redirect_to action: :index
    end
    
    def show
       id = params[:id]
       @movie = Movie.find_by(id: id)
    end
end
