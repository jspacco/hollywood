class Actor < ApplicationRecord
  # has_many is a function that tells ActiveRecord (the Rails ORM layer)
  # that the actors table has many movies using the actors_movies table
  # as the many-to-many table.
  #
  # We have to add this has_many through: command to th emodel.
  has_many :movies, through: :actors_movies
end
