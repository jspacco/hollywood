#
# This file was created by the following command-line Rails command,
# which will give the following results.
#
# bash> bin/rails generate model Actor name:string
# Running via Spring preloader in process 61751
#       invoke  active_record
#       create    db/migrate/20190301034959_create_actors.rb
#       create    app/models/actor.rb
#       invoke    test_unit
#       create      test/models/actor_test.rb
#       create      test/fixtures/actor.yml
#
# This command created 4 different files. Each one is described as follows:
#
# 1)
# db/migrate/20190301034959_create_actors.rb
# This is a migration, which creates this file.
# It explains how to create or modify a database table.
# Rails is able to take this code and convert it into the appropriate
# SQL statements to create or modify the database tables for a variety
# of database management systems (DBMS). So this same code can work
# with SQLite, Postgres, MySQL/MariaDB, and so on.
#
# DB migrations can be run like this:
#
# bash> bin/rails db:migrate
#
# Interestingly, DB migrations can also be *undone*, which is important
# because version controls systems such as Github let you get back to
# previous verisons of the code, and you can also get back to previous
# versions of the database to match the code.
#
# 2)
# app/models/actor.rb
# This is the actual class file for the model. It extends a special
# base class (ApplicationRecord) and can contain special function
# commands to create many-to-many or one-to-many relationships.
#
# 3)
# test/models/actor_test.rb
# Basically, unit tests for Ruby, similar to JUnit tests for Java.
# More on this will be included in a future version of this document.
# TODO: unit testing in Ruby
#
# 4)
# test/fixtures/actor.yml
# Test "fixtures". A fixture is basically a description of how to create
# a bunch of records in the database for testing.
# Rails by default recognizes 3 databsae configurations:
# production, development, and testing.
# The testing database configuration is so that you can run these unit
# tests against a known databse configuration. This is also why you
# want the testing database to be a totally different database: It deletes
# and recreates all of its record each time you run the test cases!
#
class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name

      t.timestamps
    end
  end
end
