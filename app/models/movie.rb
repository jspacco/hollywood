class Movie < ApplicationRecord
    # Singular because each movie has exactly one director.
    #
    # A movie "belongs to" a director because movie has a foreign key
    # called director_id that points to the directors table.
    belongs_to :director

    # Plural beacuse one movie has many actors (one to many in this direction).
    #
    # I can never remember when things are singular and plural in Rails so
    # I have to look it up all the time.
    #
    # The join tables for many-to-many.
    # Each Movie has many actors through the actors_movies table,
    # which is a join table.
    has_many :actors, through: :actors_movies
end
