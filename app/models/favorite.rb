class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :contact_id
  validates :contact_id, :uniqueness => :true
  belongs_to :contact
end
