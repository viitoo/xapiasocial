class Post < ApplicationRecord
  mount_uploader :attachment, AvatarUploader
  belongs_to :user
  validates :content, presence: true
  extend FriendlyId
  friendly_id :id

end
