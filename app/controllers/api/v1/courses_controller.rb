class Api::V1::CoursesController < Api::V1::BaseController

  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: 201
    else
      render json: course, status: 422
    end
  end

  private

    def course_params
      params.require(:course).permit(:name, :limit)
    end
end
