class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :underscore_params!

  private

  def current_user
    @current_user ||= User.first
  end

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end
end
