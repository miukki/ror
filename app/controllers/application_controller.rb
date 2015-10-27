class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_menus

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end

  def set_menus
    @main_menu_parents = Menu.where(position: 'main_menu', menu: nil).order('ordering desc')
    @team_menu = Menu.where(position: 'team_menu').order('ordering desc')
    @support_menu = Menu.where(position: 'support_menu').order('ordering desc')
    @tips_menu = Menu.where(position: 'tips_menu').order('ordering desc')
    @products_menu = Menu.where(position: 'products_menu').order('ordering desc')
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
