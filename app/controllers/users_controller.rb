class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.where(email: params[:email]).first
      render :new
      else
        @user = User.new(user_params)
        if @user.save
          redirect_to root_path
        else
          #TODO binding.pry va a poner un "breackpoint" en esa linea de ejecucion y mostrarla en consola
          # binding.pry
          # uses @user.errors | @user.errors.any? | @user.errors.messages | @user.errors.full_messages | @users.errors.count
          render :new
        end
      end
    end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end