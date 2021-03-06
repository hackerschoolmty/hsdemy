require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:student) { FactoryGirl.create :student }
  subject { student }

  describe "#associations" do
    it { should have_many(:enrollments) }
    it { should have_many(:courses).through(:enrollments) }
  end
end
