class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      # app/views/new.html.erb need a list of all of the directors,
      # so we look this data up here and put it in a variable.
      @directors = Director.all
    end

    def create
      # require/permit lets us make sure that we are in control of the fields we are
      # using from users to make DB queries.
      # Remember the dangers of Bobby Tables!
      # https://xkcd.com/327/
      # Of note here is that we are permitting two variables, since a movie
      # needs to know the title and the year.
      movie = Movie.new(params.require(:movie).permit(:title, :year))

      # This is just debugging. These prints show up in the console
      # where we ran bin/rails server, or in the logs
      puts movie.title
      puts movie.year

      # Look up the director and set to the director of the movie
      #
      # Here is the POST params created by the form:
# {"utf8"=>"✓",
# "authenticity_token"=>"HhfjjvVuldiRbPZLs+ZA7LKu9s4gdGDdfzuCTrYNs27RJLo5ejkPRqvTeEBIeOe2x2l6/9cj1lGqcSHdRyn7iw==",
# "movie"=>{"title"=>"Star Wars", "year"=>"1977"},
# "director_id"=>"1",
# "commit"=>"Save Movie"}
      #
      # Note that the director_id is outside of the movie. This is because
      # ActiveRecord knows that the movie has a foreign-key relationship to
      # a director, but it doesn't know how to fill in the director_id.
      # We are going to use the director_id to look up the director
      # record, and then put this into the movie.
      #
      # There may be a more Rails-specific way to do this, but I don't
      # know what it is is.
      #
      # The movies table has a foreign key reference
      # to the directors table. So we are using the director_id that's in
      # the form to look up the actual director record. We can set this to a
      # director variable that looks like it's inside the movie class.
      # The reason that the movie class has a director instance variable
      # inside it is that we told ActiveRecord about the foreign-key
      # relationship between Movie and Director.
      #
      # Also, we are doing all of this in one line. How cool!
      movie.director = Director.find_by(params[:director_id])

      # Remember that nothing happens to the DB until we save!
      if movie.save
        # This is how you would print out error messages if a save operation
        # were to fail, and trigger a rollback or something like that.
        redirect_to action: :index
      else
        puts movie.errors.full_messages
      end



    end

    def show
       id = params[:id]
       @movie = Movie.find_by(id: id)
    end
end
