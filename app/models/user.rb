require 'digest'

class User < ActiveRecord::Base
   attr_accessible :username, :email, :password
   validates :username, :email, :password, :presence => true
   validates :username, :email, :password, :uniqueness => true

   before_create :hash_password

   has_many :contacts

   private

   def hash_password
     self.password = self.class.hash_text(self.password)
   end

   def self.hash_text(password)
     Digest::SHA1.hexdigest(password)
   end
end
