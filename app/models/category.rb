class Category < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  validates :title, presence: true
end
