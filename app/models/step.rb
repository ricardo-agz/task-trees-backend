class Step < ApplicationRecord
  belongs_to :goal

  has_many :edges, dependent: :destroy
  has_many :goals, through: :edges

  validates :name, uniqueness:true
end
