#
# Created with the following command-line command:
#
# bash> bin/rails generate migration AddDirectorToMovies movie:references
#
class AddDirectorToMovie < ActiveRecord::Migration[5.2]
  def change
    # add_reference is a function.
    # We are adding a reference from the Movie table to the Director table
    # and adding a foreign key for this reference.
    # So, this has the effect of adding a column named director_id to
    # the Movie tables, and that column will be a foreign key, which means
    # it will automatically have a index on it.
    add_reference :movies, :director, foreign_key: true
  end
end
