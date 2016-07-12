class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :limit, :free_slots, :created_at
  has_many :students, serializer: SingleStudentSerializer
  has_one :teacher

  def free_slots
    limit - object.enrollments.size
  end
end
