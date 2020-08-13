class Todo < ApplicationRecord
  has_paper_trail
    # model association
  has_many :items, dependent: :destroy
  belongs_to :user, foreign_key: :created_by

  # validations
  validates_presence_of :title, :created_by
end
