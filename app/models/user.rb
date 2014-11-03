class User < ActiveRecord::Base
  belongs_to :primary_address, class_name: 'Address'
  has_many :addresses, foreign_key: :contact_id
  has_many :address_books
  has_many :address_books, foreign_key: :contact_id
  has_many :contacts, through: :address_books, source: :user
  has_many :requests, foreign_key: :requester_id
  has_many :requests, foreign_key: :requestee_id

  def authenticate(plain_text_password)
    password == plain_text_password
  end

  def password
    # binding.pry
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
