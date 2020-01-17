# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :enrollments,
    primary_key: :id, #key-value hash - I think users
    foreign_key: :student_id, #the foreign id that enrollment uses to link to user table
    class_name: :Enrollment #class of object (enrollments) that user has many of 

  has_many :courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

  has_many(:courses, { :primary_key => :id, foreign_key: :course_id, class_name: :Course }) #alternate syntax for the hash of each method

  has_many :enrolled_courses, 
    through: :enrollments,
    source: :course

  

end
