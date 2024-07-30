class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation pour le champ username
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  # Associations
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end
