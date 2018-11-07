class Admin::BaseController < ApplicationController
  before_action :ensure_admin!

  def ensure_admin!
    if current_user.nil? || !current_user.has_role?(:admin)
      raise Pundit::NotAuthorizedError, "not allowed to access this page"
    end
  end
end
