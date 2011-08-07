class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # helpers are available only in views not in controllers
  # include SessionsHelper makes helper available in controllers
end
