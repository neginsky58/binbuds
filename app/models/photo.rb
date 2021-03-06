class Photo < ActiveRecord::Base
  

  # has_attached_file :file, 
  #   :storage => :s3,
  #   :s3_credentials => "#{Rails.root}/config/s3.yml",
  #   :styles => { :medium => "1024x768>", :thumb => "100x100>" }, 
  #   :default_url => "no_image.jpg"


  has_attached_file :file, 
    :storage => :s3,
    :s3_credentials => { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] },
    :styles => { :medium => "1024x768>", :thumb => "100x100>" }, 
    :default_url => "no_image.jpg",
    :bucket => 'BidBuds'


  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  # attr_accessor :file_file_name
  attr_accessor :file_content_type
  attr_accessor :file_file_size
  attr_accessor :file_updated_at 

end

