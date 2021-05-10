class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
    user_path(resource.id)
    else
    corporation_path(resource.id)
    end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :area, :introduction, :image, :image_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :area, :introduction, :image, :image_cache])
  end
end
