class User < ActiveRecord::Base
  has_many :addresses, foreign_key: :contact_id
end
