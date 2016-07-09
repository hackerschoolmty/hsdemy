class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :limit, presence: true,
                    numericality: { greater_than: 1 }

  has_many :enrollments
  has_many :students, through: :enrollments
end
