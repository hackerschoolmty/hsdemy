class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :limit, :created_at
end
