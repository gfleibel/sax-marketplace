class Saxophone < ApplicationRecord
  belongs_to :user
  validates :title, :details, :manufacturer, :sax_model, :serial_number, :category, :condition, presence: true
end
