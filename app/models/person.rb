class Person < ActiveRecord::Base
  require 'paperclip'

    has_attached_file :photo,
     :styles => {
       :thumb => "100x125#",
       :profile  => "300x375>" }
       
    attr_accessible :name, :role, :profile, :photo
end
