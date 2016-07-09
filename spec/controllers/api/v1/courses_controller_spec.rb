require 'rails_helper'

RSpec.describe Api::V1::CoursesController, :type => :controller do

  describe "GET #index" do
    it "returns 4 records from the database in json" do
      4.times { FactoryGirl.create :course }
      get :index
      expect(json_response[:courses].count).to be 4
    end
  end

  describe "GET #show" do
    it "returns a single record" do
      course = FactoryGirl.create :course
      get :show, id: course.id
      expect(json_response[:course][:name]).to eql course.name
    end
  end

end
