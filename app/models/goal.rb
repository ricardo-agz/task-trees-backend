class Goal < ApplicationRecord
  has_many :steps, dependent: :destroy

  has_many :edges, dependent: :destroy
  has_many :steps, through: :edges

  validates :name, uniqueness:true
end
