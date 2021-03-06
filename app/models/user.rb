class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :status, presence: true

  enum status: [:novice, :user, :trusted, :vip, :admin]

  before_create -> {self.name = email}

end
