#
# Created with the following command-line command:
#
# bash> bin/rails generate model Movie name:string year:integer
#
class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year

      t.timestamps
    end
  end
end
