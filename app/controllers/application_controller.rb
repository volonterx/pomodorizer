class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  private

  def current_user
    @current_user ||= User.first
  end
end
