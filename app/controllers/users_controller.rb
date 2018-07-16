class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.register_email(@user).deliver_now
      redirect_to root_path
    else
      # TODO binding.pry va a poner un "breackpoint" en esa linea de ejecucion y mostrarla en consola
      # binding.pry
      # uses @user.errors | @user.errors.any? | @user.errors.messages | @user.errors.full_messages | @users.errors.count
      render register_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
