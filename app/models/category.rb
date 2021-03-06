class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {maximum: 100},
    uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 300}
end
