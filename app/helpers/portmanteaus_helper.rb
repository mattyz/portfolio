module PortmanteausHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
   if img
     retrurn img.model.main_image? || img.model.thumb_image?
   else
     if type == 'thumb'
      image_generator(height:"350", width:"200")
    else
      image_generator(height:"600", width:"400")
    end
   end
  end
end
#    self.main_image ||=  Placeholder.image_generator("600","400")
#   self.thumb_image ||=  Placeholder.image_generator("350", "200")

