class List < ApplicationRecord
  belongs_to :boards

  has_many :tasks, dependent: :destroy
end
