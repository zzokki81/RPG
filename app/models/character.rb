class Character < ApplicationRecord
  has_one_attached :image
  has_many :char_attributes, dependent: :destroy
  accepts_nested_attributes_for :char_attributes, allow_destroy: true
end
