class StudentsController < ApplicationController
  before_action :require_user, only:[:index, :show]
  before_action :set_student, only:[:edit, :show, :update]
  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully signed up"
      redirect_to @student
    else
      flash[:error] = @student.errors.full_messages
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @student.update(student_params)
      flash[:success] = "You have successfully updated your profile"
      redirect_to @student
    else
      flash[:error] = @student.errors.full_messages
      render 'edit'
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end

end