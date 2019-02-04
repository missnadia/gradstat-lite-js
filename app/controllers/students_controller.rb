class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
  
    def show
    end
  
    def new
      @student = Student.new
    end
  
    def edit
    end
  
    def create
      @student = Student.create(student_params)
      if @student.save
        session[:student_id] = @student.id
        redirect_to student_path(@student)
      else
        render :new
      end
    end
  
    def update
      if @student.update(student_params)
        redirect_to student_path(@student)
      else
        render :edit
      end
    end
  
    private
  
    def set_student
      @student = Student.find(params[:id])
    end
  
    def student_params
      params.require(:student).permit(
        :username,
        :password,
        :email,
        :first_name,
        :last_name,
        :admin,
        :name,
        :provider,
        :uid,
        :oauth_token,
        :oauth_expires_at
      )
    end
  end  