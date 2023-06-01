class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :saxophones
  validates :full_name, :address, presence: true

  include AlgoliaSearch

  algoliasearch per_environment: true do
    attribute :full_name
  end
end
