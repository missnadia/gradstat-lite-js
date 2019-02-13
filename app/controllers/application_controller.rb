class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login, except: [:home, :new, :create]
    helper_method :current_user
    include ActionController::Serialization
  
    private
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= Student.find(session[:student_id]) if session[:student_id]
    end
  
    def require_login
      redirect_to root_path unless logged_in?
    end
  end  