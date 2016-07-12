require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  let(:teacher) { FactoryGirl.create :teacher }
  subject { teacher }

  describe "#validations" do
    it { should validate_presence_of(:name) }
  end

  describe "#associations" do
    it { should have_many(:courses) }
  end
end
