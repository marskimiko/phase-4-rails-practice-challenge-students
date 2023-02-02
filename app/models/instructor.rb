class Instructor < ApplicationRecord
  attributes :id, :name
  
  has_many :students

  validates :name, presence: true
end
