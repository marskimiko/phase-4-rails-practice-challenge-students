class Student < ApplicationRecord
  attributes  :id
  belongs_to :instructor

  validates :name, presence: true
  validates :age, numericality: { greater_than: 17 }
end
