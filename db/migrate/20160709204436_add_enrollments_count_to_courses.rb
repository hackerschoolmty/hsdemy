class AddEnrollmentsCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :enrollments_count, :integer, default: 0

    #
    Course.all.each do |course|
      Course.update_counters course.id, :enrollments_count => course.enrollments.length
    end
  end

end
