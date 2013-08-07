class User < ActiveRecord::Base
   attr_accessible :username, :email
   validates :username, :email, :presence => true
   validates :username, :email, :uniqueness => true

   has_many :contacts
   has_many :favorites
   has_many :favorite_contacts,
            :through => :favorites,
            :source => :contact

end
