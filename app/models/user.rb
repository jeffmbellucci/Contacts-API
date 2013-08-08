require 'digest'

class User < ActiveRecord::Base
   attr_accessible :username, :email, :password
   validates :username, :email, :password, :presence => true
   validates :username, :email, :password, :uniqueness => true

   before_save :hash_password

   has_many :contacts

   def self.log_in(username, password)
     self.find_by_username_and_password(username, User.hash_text(password))
   end

   def hash_password
     self.password = self.class.hash_text(self.password)
   end

   def self.hash_text(password)
     Digest::SHA1.hexdigest(password)
   end
end
