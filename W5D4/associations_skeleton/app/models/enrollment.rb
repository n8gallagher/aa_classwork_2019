# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
  belongs_to :student, #method name
    primary_key: :id, #key-value hash
    foreign_key: :student_id,   #the foreign id that enrollment uses to link to user table
    class_name: :User #the class that our enrollment belongs to 
    
  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
end
