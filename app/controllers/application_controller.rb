# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :agreement, store_attributes: [:name]])
  end

  def authenticate_user!(options = {})
    Current.store = current_user&.store
    super
  end

  def current_store
    Current.store
  end
end
