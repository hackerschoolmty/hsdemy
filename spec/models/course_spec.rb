require 'rails_helper'

RSpec.describe Course, :type => :model do
  let(:course) { FactoryGirl.build :course }
  subject { course }

  describe "#validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:limit) }
    it { should validate_numericality_of(:limit).is_greater_than(1) }
  end

  describe "#associations" do
    it { should belong_to :teacher }
    it { should have_many(:enrollments) }
    it { should have_many(:students).through(:enrollments) }
  end

  describe "#scopes" do

    describe ".search" do
      it "returns every record when the pattern is empty" do
        course1 = FactoryGirl.create :course, name: "Ruby 101"
        course2 = FactoryGirl.create :course, name: "JS 101"

        expect(Course.search.to_a).to eql [course1, course2]
      end

      it "returns the courses with a name pattern" do
        course1 = FactoryGirl.create :course, name: "Ruby 101"
        course2 = FactoryGirl.create :course, name: "JS 101"

        expect(Course.search("ruby").to_a).to eql [course1]
      end

      it "returns the courses with 101 pattern" do
        course1 = FactoryGirl.create :course, name: "Ruby 101"
        course2 = FactoryGirl.create :course, name: "JS 101"
        course3 = FactoryGirl.create :course, name: "Lol"

        expect(Course.search("101").to_a).to eql [course1, course2]
      end
    end
  end

end
