class ApplicationController < ActionController::Base

  def actions_admin
    redirect_to movies_path unless current_user.has_role?(:admin)
  end
end
