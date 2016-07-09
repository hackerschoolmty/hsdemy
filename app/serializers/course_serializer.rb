class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :limit, :free_slots, :created_at

  def free_slots
    limit - object.students.count
  end
end
