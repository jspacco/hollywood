class ActorsController < ApplicationController
    def index
        # actors#index
        # Called when URL with with /actors receives HTTP GET
        # Helper function to get this path is actors_path
        # After this controller is called, we use the
        #   template in views/actors/index.html.erb
        #   to produce an HTML file
        #
        # @actors is a variable that will be visible in views/actors/index.html.erb
        # The @ sign means that it's an instance variable. Rails uses some magic
        # to make these instance variables created in the controller visible
        # in the view template.
        @actors = Actor.all
    end

    def create
        # actors#create
        # called when URL with /actors receives HTTP POST
        # helper function for the path is actors_path
        #
        # creates an actor record as a LOCAL variable
        # params is created by Rails and is a hash that contains the key-value
        # pairs sent from the form.
        # The form will have created a params has that looks something like
        # what we see below.
        #
# { "utf8"=>"✓",
#   "authenticity_token"=>"/+7cLi6eAgYSwCg+GD1ItyU7/ok+F6aFHNnQNnjQYcwrtyZiBQyJuPZwh0lypnM9PkupUtGhHfZu9Aj2NKaA5g==",
#   "actor"=>{ "name"=>"Tom Hanks" },
#   "commit"=>"Save Actor"
# }
        #
        # Note that "actor" as a key has a value that is itself a hash.
        # require gets us the top-level key (actor), while permit gets
        # us the sub-keys (name).
        #
        #
        # require vs permit documentation
        # https://api.rubyonrails.org/classes/ActionController/Parameters.html
        #

        #
        # The require method tells params that we are building an actor,
        # so we require "actor" as a key in the params.
        #
        # The permit() method tells us that the actor we are building
        # is permitted to have a field called "name".
        #
        # ActiveRecord will then figure out how to set all of the
        # instance variables using data from the params.
        #
        # One other Ruby-specific note is that :actor and :name
        # are symbols. Symbols are kind of like constants in other
        # languages. They are stronger than regular strings, and
        # sybols are immutable (which matters because Ruby has
        # mutable strings, unlike languages such as Java and C#).
        # http://rubylearning.com/satishtalim/ruby_symbols.html
        actor = Actor.new(params.require(:actor).permit(:name))

        # Until we call save, we have an actor record in the Ruby code
        # but not in the database. If this save method fails we will
        # see a "rollback" in the log. The log is in the log folder,
        # or in the terminal where you ran 'bin/rails server'
        #
        # Also, save is a method call, so we could also write this:
        # actor.save()
        # and it would do the same thing. Ruby code tends to omit parentheses
        # whenever possible. 
        actor.save

        # This redirects back to the path for index for this controller, so:
        # GET /actors
        #
        # We could probably make app/views/create.erb.html
        # and have that file give a message about how we successfully
        # created a new actor, or something like that. But it's easier
        # to just redirect back to the index
        redirect_to action: :index
    end

    def show
      # actors#show
      # GET /actors/:id
      # helper method: actor_path(:id)
      #
      # The :id part means a parameter that is the id (primary key)
      #
      # Get the id parameter out of the params hash.
      # The params has will look like this:
      # {"id"=>"1"}
      # There is no top-level "actors" key like there was for actors#create
      # because we are not filling out a form.
      id = params[:id]
      # look up one actor record using the primary key
      # The find_by method is an ActiveRecord method that was automaticaly added
      # to the Actor class (it's basically a static method).
      # You can look up all of the possible ActiveRecord methods here:
      # https://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html
      @actor = Actor.find_by(id: id)
    end
end
