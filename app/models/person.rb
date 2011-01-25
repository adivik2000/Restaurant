class Person < ActiveRecord::Base
  default_scope  :order => :position  
  require 'paperclip'

       has_attached_file :photo,
       :storage => :s3,
       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
       :path => "/:style/:filename",
         :styles => {
           :template1_index => "100x125#",
           :template1_show  => "300x375>"
            }
           
           # # = exact aspect ratio
           # > = makes the largest size the size you specify    
       
    attr_accessible :name, :role, :profile, :photo, :site_id
end
