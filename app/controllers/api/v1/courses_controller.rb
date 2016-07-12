class Api::V1::CoursesController < Api::V1::BaseController

  def index
    if params[:teacher_id].present?
      teacher = Teacher.find(params[:teacher_id])
      render json: teacher.courses
    else
      render json: Course.all
    end
  end

  def show
    render json: Course.find(params[:id])
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: 201
    else
      render json: { course: { errors: course.errors } }, status: 422
    end
  end

  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      render json: course, status: 200
    else
      render json: { course: { errors: course.errors } }, status: 422
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    head 204
  end

  private

    def course_params
      params.require(:course).permit(:name, :limit)
    end
end
