class Api::V1::EnrollmentsController < Api::V1::BaseController

  def create
    course = Course.find(params[:course_id])

    enrollment = course.enrollments.build(enrollment_params)
    if enrollment.save
      render json: enrollment, status: 201
    else
      render json: enrollment, status: 422
    end
  end

  private

    def enrollment_params
      params.require(:enrollment).permit(:student_id)
    end
end
