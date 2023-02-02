class StudentsController < ApplicationController

  def index
    render json: Student.all
  end

  def show
    student = Student.find_by_id(params[:id])

    if student
      render json: student
    else
      render json: { error: "Student not found"}, status: :not_found
    end
  end

  def create 
    new_student = Student.create( student_params)

    if new_student.valid?
      render json: new_student
    else
      render json: { error: new_student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    student = Student.find_by_id(params[:id])
    if student
      student.update(student_params)
      render json: student
    else
      render json: { error: "student not found" }, status: :not_found
    end
  end 

  private

  def student_params
    params.permit( :name, :major, :age, :instructor_id )
  end

end
