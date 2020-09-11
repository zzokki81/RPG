class CharAttribute < ApplicationRecord
  has_one_attached :avatar_icon
  belongs_to :character
  validates_presence_of :character
end
