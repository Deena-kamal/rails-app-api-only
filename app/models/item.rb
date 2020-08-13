class Item < ApplicationRecord
  has_paper_trail
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :name
end
