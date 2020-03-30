class ApplicationController < ActionController::Base
  def boring_science_user
    User.first!
  end
end
