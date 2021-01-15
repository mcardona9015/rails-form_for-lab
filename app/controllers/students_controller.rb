class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params(:first_name, :last_name))
    flash[:messages]
    if student.valid?
      redirect_to student_path(student)
    else
      flash[:messages] = student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end
end
