class Contact < ActiveRecord::Base
   attr_accessible :name, :address, :phone_number, :email, :user_id
   validates :user_id, presence: true

   belongs_to :user
   has_one :favorite

   def self.favorited_for_user_id(id)
     self.joins(:favorite).where("contacts.user_id = ?", id)
   end
 end