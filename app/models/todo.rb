class Todo < ApplicationRecord
    # model association
  has_many :items, dependent: :destroy
  belongs_to :user, optional: true

  # validations
  validates_presence_of :title, :created_by
end
