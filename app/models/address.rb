class Address < ActiveRecord::Base
  has_many  :users, foreign_key: :primary_address_id
  belongs_to :contact, class_name: 'User'
end
