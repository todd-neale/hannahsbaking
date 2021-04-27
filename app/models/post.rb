class Post < ApplicationRecord
  has_rich_text :body
  has_one_attached :photo

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  has_many :directions, dependent: :destroy
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: :true


  #This validates presence of title, and makes sure that the length is not more than 140 words
  validates :title, presence: true, length: {maximum: 140}
  #This validates presence of body
  validates :body, presence: true
end
