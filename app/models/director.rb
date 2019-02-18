class Director < ApplicationRecord
    # plural because it's one to many from director to movie
    has_many :movies
end
