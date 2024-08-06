class Photo < ApplicationRecord
  belongs_to :photoable, polymorphic: true

  scope :General, -> { where(category: :General)}
  scope :Before, -> { where(category: :Before)}
  scope :After, -> { where(category: :After)}
  scope :Printable, -> { where(is_printable: true) }
  scope :NotPrintable, -> { where(is_printable: false) }

  enum category: [:General, :Before, :After]

  mount_uploader :image, ImageUploader 

  before_create do
    puts image.path
#    if File.extname(image.path) != ".pdf" 
    if File.extname(image.path) == ".jpg" or File.extname(image.path) == ".jpeg"  
  		if EXIFR::JPEG.new(image.path).exif?   
        begin             # => true
  			   PhotoGeoloader.new(image.path).place_attributes self  
           self.photo_datetime = EXIFR::JPEG.new(image.path).date_time
        rescue Exception
          puts "Error in setting GPS data"
        end         
  		end
	  end
  end 

  private
   
  def update_gps
    if self.latitude? and self.photoable_type = "Task"
      task = Task.find(self.photoable_id)
      task.latitude = self.latitude
      task.altitude = self.altitude
      task.longitude = self.longitude
      task.save
    end   
  end

end
