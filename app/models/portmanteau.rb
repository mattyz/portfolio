class Portmanteau < ApplicationRecord
  include Placeholder

  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.activities
    where(subtitle: 'Activities')
  end
 
  # preferred way
  # Pormanteau.portolio_activities
  scope :portfolio_activities, lambda {where(subtitle: 'Activities')}

  # callback to set defaults, runs when a new is created
  after_initialize :set_defaults

  def set_defaults
   self.main_image ||=  Placeholder.image_generator(height:"600", width: "400")
   self.thumb_image ||=  Placeholder.image_generator(height:"350", width: "200")

#    self.main_image ||= "http://placehold.it/600x400" 
#    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
