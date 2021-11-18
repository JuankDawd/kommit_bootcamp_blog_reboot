class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true, allow_nil: false
  validates :body, presence: true, length: { minimum: 10 }
end
