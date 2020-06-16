class Skill < ApplicationRecord
  includes Placeholder

  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  def set_defaults
   # replece below with a concern 
   # self.badge||= "http://placehold.it/200x200" 
   # self.badge||=  Placeholder.image_generator(height:"200", width: "200")
   self.badge||=  Placeholder.image_generator("200","200")
  end

end
