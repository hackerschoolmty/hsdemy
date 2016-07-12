class AddTeacherIdToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :teacher, index: true
    add_foreign_key :courses, :teachers
  end
end
