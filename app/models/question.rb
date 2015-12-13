class Question < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
end
