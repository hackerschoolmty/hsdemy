class Api::V1::StudentsController < ApplicationController

  def show
    render json: Student.find(params[:id])
  end
end
