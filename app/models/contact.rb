class Contact < ActiveRecord::Base
   attr_accessible :name, :address, :phone_number, :email, :user_id
   validates :user_id, presence: true

   belongs_to :user
   has_one :favorite
   has_one :user_who_favors,
           :through => :favorite,
           :source => :user
end
