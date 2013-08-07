ActiveRecord::Base.transaction do
  users = User.create([
    {username: 'andrea', email: 'an@dr.ea'},
    {username: 'test', email: 'test'}
  ])
  contacts = Contact.create([
    {name: 'anne', address: '121 main', phone_number: 33, email: 'email', user_id: 1},
    {name: 'tom', address: '100 main', phone_number: 12, email: 'gmail', user_id: 1},
    {name: 'bob', address: '121 main', phone_number: 33, email: 'hyaho', user_id: 1},
    {name: 'anne2', address: '121 1st', phone_number: 334, email: 'email1', user_id: 1}
  ])
  favorites = Favorite.create([
    {user_id: 1, contact_id: 1}, {user_id: 1, contact_id: 2}
  ])
end