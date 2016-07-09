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

  describe "POST #create" do
    context "when is success" do
      it "returns the record that was just created" do
        course_params = { name: "Mobile 101", limit: 20 }
        post :create, { course: course_params }

        expect(json_response[:course][:name]).to eql "Mobile 101"
      end

      #it { expect(response).to have_http_status(201) }
    end
    context "when is not success" do
      it "returns the object with an errors key" do
        course_params = { name: "Mobile 101" }
        post :create, { course: course_params }

        expect(json_response[:course]).to have_key(:errors)
      end
    end
  end

end
