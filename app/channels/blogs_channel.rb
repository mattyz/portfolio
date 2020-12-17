class BlogsChannel < ApplicationCable::Channel

# point to what the stream is refferring to
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel" 
  end

  #user left the channel
  def unsubscribed
    
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end

end
