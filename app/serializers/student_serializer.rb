class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :course_ids
  has_many :courses
end
