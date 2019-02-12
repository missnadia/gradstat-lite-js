class CommentsController < ApplicationController
    before_action :set_course, only: [:edit, :create, :update, :destroy]
    before_action :set_comment, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new
    end

    def edit
    end
    
    def create
        @comment = @course.comments.create(params[:comment].permit(:comment))
        redirect_to @course
    end

    def update
        if @comment.update(comment: params[:comment])
           redirect_to @course
        else
           render :edit
        end
    end
  
    def destroy
        @comment.destroy
        redirect_to @course
    end

    private

    def set_course
        @course = Course.find(params[:course_id])
    end

    def set_comment
        @comment =  @course.comments.find(params[:id])
    end
end
