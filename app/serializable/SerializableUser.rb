class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :password, :password_confirmation, :username, :first_name, :last_name

  
end