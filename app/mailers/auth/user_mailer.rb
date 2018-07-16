class Auth::UserMailer < ApplicationMailer
  def register_email(user)
    @user = user
    mail( to: @user.email,
      subjet: "Welcome to the site!" )
  end
end
