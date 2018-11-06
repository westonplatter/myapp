class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # include Pundit
  #
  # layout :layout_by_resource
  #
  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || authenticated_root_path
  # end
  #
  # def ensure_connected_stripe!
  #   return if current_user.has_role?(:admin)
  #
  #   unless current_user.account_connected_stripe?
  #     # @todo @weston - give user flash message, "Please connect your stripe account in order to access stripe data"
  #     redirect_to "/integrations"
  #     return
  #   end
  # end

  private

  def layout_by_resource
    if devise_controller?
      return "devise"
    end
    # elsif(self.class == LandingPageController)
    #   "application"
    # elsif(current_user)
    #   "dashboard"
    # end
    "application"
  end
end
