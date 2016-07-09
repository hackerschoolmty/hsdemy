class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course, counter_cache: true

  validates :course_id, uniqueness: { scope: :student,
                                      message: "already enrolled" }
end
