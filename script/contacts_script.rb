require 'rest-client'
require 'addressable/uri'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json',
  query_values: {:burgers => "RSTUVWXYZ"}
).to_s

RestClient.get(url)

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1',
).to_s

RestClient.get(url)

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.json',
  query_values: {'stuff[a]' => 'air', 'stuff[b]' => 'bananas', 'burgers' => 'burgers'}
).to_s

RestClient.get(url)

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users'
#   ).to_s
#
#RestClient.post(url, :user => {:username => 'Ned', :email => 'ned@yahoo.com'})

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/3'
#   ).to_s
#
# RestClient.delete(url)

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1'
#   ).to_s
#
# RestClient.put(url, :attrs => {:username => 'Geoff', :email => 'geoff!'})

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2/contacts'
  ).to_s

RestClient.post(url, :contact => {name: "dylan", address: "1061 market",
              email: "dylan@d.com", phone_number: 444444444})