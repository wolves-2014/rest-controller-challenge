class Address < ActiveRecord::Base
  belongs_to :contact#, class_name: 'User'
end
