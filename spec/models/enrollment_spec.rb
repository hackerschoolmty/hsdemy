require 'rails_helper'

RSpec.describe Enrollment, :type => :model do
  let(:enrollment) { FactoryGirl.create :enrollment }
  subject { enrollment }

  describe "#associations" do
    it { should belong_to(:course) }
    it { should belong_to(:student) }
  end

end
