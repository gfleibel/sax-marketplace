class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  include AlgoliaSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :saxophones
  validates :full_name, :address, presence: true

  algoliasearch do
    attribute :full_name
  end
end
