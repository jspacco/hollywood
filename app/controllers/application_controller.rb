class ApplicationController < ActionController::Base
  # This is the base class for all Controllers.
  # It actually extends ActionController::Base, which used
  # to be the base class for all Controllers in a previous
  # version of Rails. Having a common base class lets us have
  # a common place to put things that all controllers need to inherit.
  #
  # We aren't going to use this class for anything, so this class just sits here.
  # Rails uses the fact that all Controllers extend the same base class
  # to do a lot of things behind-the-scenes to make Rails work.
end
