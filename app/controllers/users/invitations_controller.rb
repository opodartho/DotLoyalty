module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters

    protected
    def invite_params
      # need to set agreement by user
      devise_parameter_sanitizer.sanitize(:invite).merge("store_id" => current_store.id, "agreement" => true)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [:name, :role])
    end
  end
end
