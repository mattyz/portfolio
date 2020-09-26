class Portmanteau < ApplicationRecord
  include Placeholder

  has_many :technologies
  # choose technology to include when creating updating portfolio and
  # add validation to not include the technology if the name is blank
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda{ |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  mount_uploader :thumb_image, PortmanteauUploader
  mount_uploader :main_image, PortmanteauUploader

  def self.activities
    where(subtitle: 'Activities')
  end
 
  # preferred way
  # Pormanteau.portolio_activities
  scope :portfolio_activities, lambda {where(subtitle: 'Activities')}

  # callback to set defaults, runs when a new is created
  after_initialize :set_defaults

  def set_defaults
   # self.main_image ||=  Placeholder.image_generator(height:"600", width: "400")
   # self.thumb_image ||=  Placeholder.image_generator(height:"350", width: "200")

   self.main_image ||=  Placeholder.image_generator("600","400")
   self.thumb_image ||=  Placeholder.image_generator("350", "200")

#    self.main_image ||= "http://placehold.it/600x400" 
#    self.thumb_image ||= "http://placehold.it/350x200"
  end

  # for drag and drop interface
  def self.by_position
    order("position ASC")
  end
end
