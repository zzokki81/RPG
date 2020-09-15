class Character < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :char_attributes, dependent: :destroy
  accepts_nested_attributes_for :char_attributes, allow_destroy: true
  validates :name, presence: true, uniqueness: true
  validates :images, presence: false
  paginates_per 4
end
