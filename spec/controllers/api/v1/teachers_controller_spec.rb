require 'rails_helper'

RSpec.describe Api::V1::TeachersController, :type => :controller do
  describe "GET #index" do
    it "returns 4 records from the database in json" do
      4.times { FactoryGirl.create :teacher }
      get :index
      expect(json_response[:teachers].count).to be 4
    end
  end

  describe "GET #show" do
    it "returns a single record" do
      teacher = FactoryGirl.create :teacher
      get :show, id: teacher.id
      expect(json_response[:teacher][:name]).to eql teacher.name
    end
  end

end
