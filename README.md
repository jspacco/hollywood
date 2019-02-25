# README

Demo Rails project that is full of documentation

* actors_controller describes the different controller methods and the paths that trigger them
*

|HTTP-Verb | Path | Controller#Action | Named Helper |
|----------|:-----|:------------------|:-------------|
| GET      | /actors          | images#index   | actors_path          |
| GET      | /actors/new      | images#new     | new_actor_path       |
| POST     | /actors          | images#create  | actors_path          |
| GET      | /actors/:id      | images#show    | actor_path(:id)      |
| GET      | /actors/:id/edit | images#edit    | edit_actor_path(:id) |
| PATCH/PUT| /actors/:id      | images#update  | actor_path(:id)      |
| DELETE   | /actors/:id      | images#destroy |  photo_path(:id)     |

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
