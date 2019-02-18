class Movie < ApplicationRecord
    # singular because it's many to one from movie to director
    belongs_to :director
    
    # the join tables for many-to-many
    has_many :actors, through: :actors_movies
end
