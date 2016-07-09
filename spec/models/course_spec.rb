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
    it { should have_many(:enrollments) }
    it { should have_many(:students).through(:enrollments) }
  end

end
