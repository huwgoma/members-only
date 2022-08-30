class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true

  def updated?
    updated_at > created_at
  end
end
