class ActorsMovie < ApplicationRecord
  # join table that facilitates a many-to-many relationship
  # between actors and movies. Thus, this class "belongs to"
  # both the actor table (because actor_id in this table is a
  # foriegn key to the id of the actors table) and the movie table.
  belongs_to :actor
  belongs_to :movie
end
