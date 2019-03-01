#
# This migration was created by the following command:
#
# bash> bin/rails g migration CreateJoinTableActorMovie actor movie
#
# Rails understands that we are creating a many-to-many join table
# and the combination of the title of the migration (CreateJoinTableActorMovie)
# and the parameters 'actor' and 'movie' passed to the command tell
# Rails that we want this to be a join table for Actor and Movie.
#
# Rails has a very sophisticated command-line syntax for generating
# model classes and migrations. But, it's not necessarily intuitive.
# Once you generate the migration, you can always go in and edit
# the migration to make sure it has the proper columns and indexes.
#
# Just be very careful editing the names of migrations once they are
# created! I've run into problems with this, and it was difficult to fix.
# I would recommend not changing the names of migrations.
#
class CreateJoinTableActorMovie < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actors, :movies do |t|
      # The migration creates both of these indexes, but comments
      # them out. There is probably some magical way to make
      # the migration command uncomment these, but I always just
      # go into this file and uncomment them manually.
      t.index [:actor_id, :movie_id]
      t.index [:movie_id, :actor_id]
    end
  end
end
