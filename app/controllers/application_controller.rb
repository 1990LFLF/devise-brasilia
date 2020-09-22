class ApplicationController < ActionController::Base

  # CÓDIGO QUE DEVE SER EXECUTADO EM TODAS AÇÕES,
  # DE TODOS CONTROLLERS,
  # FICA AQUI! No ApplicationController

  # Para só permitir que usuários logados tenham acesso
  # às ações de TODOS os controllers do meu projeto
  before_action :authenticate_user!

  # Para adicionar campos ao Strong Parameters do Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
