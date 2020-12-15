class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :content, presence: true, length: {minimum: 5, maximum: 1000 }


 # add a callback
  # no route on ACtionCable, use background job below
  after_create_commit { CommentBroadcastJob.perform_later(self)}
  def subscribed
    stream_from "comment"
  end
end
