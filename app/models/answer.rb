class Answer < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  validates :text, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true
end
