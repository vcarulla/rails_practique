class User < ApplicationRecord
  has_secure_password
  #TODO http://api.rubyonrails.org/v5.0/classes/ActiveModel/Validations/ClassMethods.html
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :role, inclusion: %w(admin user)
  before_create :generate_confirmation_token

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex
  end

  def confirmed?
    self.confirmed_at.present?
  end

  def admin?
    self.role == 'admin'
  end
end
