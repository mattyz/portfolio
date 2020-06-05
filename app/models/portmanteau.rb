class Portmanteau < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.activities
    where(subtitle: 'Activities')
  end
 
  # preferred way
  # Pormanteau.portolio_activities
  scope :portfolio_activities, ~> {where(subtitle: 'Activities')}
end
