class Api::V1::StudentsController < Api::V1::BaseController

  def show
    render json: Student.find(params[:id])
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: student, status: 201
    else
      render json: { student: { errors: student.errors } }, status: 422
    end
  end

  private

    def student_params
      params.require(:student).permit(:name)
    end
end
