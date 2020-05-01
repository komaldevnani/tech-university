class Course < ActiveRecord::Base
  validates :short_name, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 6, maximum: 60}
  has_many :student_courses
  has_many :students, through: :student_courses
end