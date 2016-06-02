class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
      flash[:error] = 'Recurso no encontrado.'
      redirect_back_or root_path
  end

  def after_sign_in_path_for(member)
    if current_member.organization.present?
      eventos_path
    else
      new_organization_path
    end
  end

end
