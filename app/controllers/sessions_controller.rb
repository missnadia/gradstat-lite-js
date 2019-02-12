class SessionsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    if auth_hash
      if student = Student.find_by(email: auth_hash.info.email)
        login_redirect(student)
      else
        student = Student.from_omniauth(auth_hash)
        login_redirect(student)
      end
    elsif student = Student.find_by(email: params[:student][:email])
      if student && student.authenticate(params[:student][:password])
        login_redirect(student)
      else
        redirect_to '/login', notice: 'Incorrect Email/Password'
      end
    else
      redirect_to '/login', notice: 'Incorrect Email/Password'
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_url
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  def login_redirect(student)
    session[:student_id] = student.id
    redirect_to courses_url
  end
end
