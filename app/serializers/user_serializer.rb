class UserSerializer
  include JSONAPI::Serializer
  attributes :username
  # Add User Watchlist
end
