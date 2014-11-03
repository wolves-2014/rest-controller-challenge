class Request < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :requestee, class_name: 'User'

  def share_contact
    self.requestee.contacts.each do |contact|
      self.requester.contacts << contact
    end
    self.save
    self.destroy
  end

end
