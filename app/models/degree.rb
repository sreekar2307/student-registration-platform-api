class Degree < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  has_many :courses
  has_many :students
end
