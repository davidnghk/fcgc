class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick                                                  

  # include CarrierWave::MimeTypes

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # process :auto_orient # this should go before all other "process" steps
  process :auto_orient, :if => :is_jpg? 
  process :auto_orient, :if => :is_jpeg? 
  # Process files as they are uploaded:
  # process :resize_to_limit => [1600, 1600], :if => :is_jpg?  
  # process :efficient_conversion, :if => :pdf?
  #  process :convert => 'png'

  version :medium do
     process :resize_to_limit => [500, 500]
  end

  # Create different versions of your uploaded files:
  version :thumb do
     process :auto_orient, :if => :is_jpg? 
     process :auto_orient, :if => :is_jpeg? 
     process :resize_to_limit => [100, 100]

    def efficient_conversion
      manipulate! do |img|
        img.format("png") do |c|
          c.fuzz        "3%"
          c.trim
          c.colorspace  "sRGB"
        end
        img
      end
    end

   def full_filename (for_file = model.logo.file)
     super.chomp(File.extname(super)) + '.jpg'
   end 
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg pdf png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  #def filename
  #  super.chomp(File.extname(super)) + '.png' if original_filename.present?
  #end
  # def filename
  #   "something.jpg" if original_filename
  # end
  def set_content_type(*args)
     self.file.instance_variable_set(:@content_type, "image/jpeg")
  end

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  protected

    def pdf?(new_file)
      new_file.content_type.include? "/pdf"
    end

    def is_jpg?(picture)
      picture.extension.to_s.downcase == 'jpg'
    end
    
    def is_jpeg?(picture)
      picture.extension.to_s.downcase == 'jpeg'
    end

end
