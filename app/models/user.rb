class User < ApplicationRecord
  has_secure_password
  #TODO http://api.rubyonrails.org/v5.0/classes/ActiveModel/Validations/ClassMethods.html
  validates :email, format:{ with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})z/i }

end
