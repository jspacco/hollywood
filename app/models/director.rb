class Director < ApplicationRecord
    # movies is plural because it's one to many from director to movie
    # There are rules for when something is singular and when it is
    # plural in Rails but I can never remember so I have to look them
    # up all the time.
    has_many :movies
end
