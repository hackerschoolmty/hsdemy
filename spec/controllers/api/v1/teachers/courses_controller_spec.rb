require 'rails_helper'

RSpec.describe Api::V1::Teachers::CoursesController, :type => :controller do

  describe "GET #index" do
    context "when the :q param IS present" do
      it "return just the courses for a single teacher" do
        teacher = FactoryGirl.create :teacher

        FactoryGirl.create :course, name: "Ruby 101", teacher: teacher
        FactoryGirl.create :course, name: "Rails 101", teacher: teacher
        FactoryGirl.create :course, name: "Javascript", teacher: teacher

        get :index, { teacher_id: teacher.id, q: "java" }
        expect(json_response[:courses].count).to be 1
      end
    end
    context "when the :q param IS NOT present" do
      it "return just the courses for a single teacher" do
        teacher = FactoryGirl.create :teacher

        3.times { FactoryGirl.create :course, teacher: teacher }

        get :index, { teacher_id: teacher.id }
        expect(json_response[:courses].count).to be 3
      end
    end
  end

end
