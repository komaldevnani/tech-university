class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    student = Student.find_by(email: params[:session][:email])
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:success] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
end