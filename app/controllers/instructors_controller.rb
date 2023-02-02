class InstructorsController < ApplicationController
  
  def index
    render json: Instructor.all
  end

  def show
    instructor = Instructor.find_by_id(params[:id])

    if instructor
      render json: instructor
    else
      render json: { error: "instructor not found" }, status: :not_found
    end
  end

  def create
    new_instructor = Instructor.create( instructor_params )

    if new_instructor.valid?
      render json: new_instructor
    else
      render json: { error: new_instructor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    instructor = Instructor.find_by_id(params[:id])
    if instructor
      instructor.update(instructor_params)
      render json: instructor
    else
      render json: { error: "instructor not found" }, status: :not_found
    end
  end

  def destroy
    instructor = Instructor.find_by_id(params[:id])

    if instructor
      instructor.destroy
      head :no_content
    else
      render json: { error: "instructor not found"}, status: :not_found
    end
  end

  private

  def instructor_params
    params.permit(:name)
  end

end
