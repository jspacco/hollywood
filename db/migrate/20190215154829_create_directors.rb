#
# Created with the following command-line command:
#
# bash> bin/rails generate model Director name:string
#
class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name

      t.timestamps
    end
  end
end
