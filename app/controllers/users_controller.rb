class UsersController < ApplicationController
  skip_before_action :restrict_user, only: [:new, :create, :sign_in, :auth_login]

  def new
    @user = User.new
    @user.build_image
  end

  def create
    @user = User.new (params_user)
   if @user.save(validate: false)
     SentMailsMailer.welcome(@user).deliver_now!
    session[:user_id] = @user.id
      redirect_to products_path
      flash[:msg] = "Succesfully signed up"
    else
      render :new
      flash[:msg] = "Please retry"
    end
 end

 def auth_login
   @user = User.where(email: params[:email], password: Digest::MD5.hexdigest(params[:password]))
   if not @user.blank?
     session[:user_id] = @user.last.id
     redirect_to products_path
     flash[:txt] = "Succesfully logged in"
   else
     redirect_to sign_in_users_path
     flash[:txt] = "email and password not matching"
   end
 end


  def edit
  end

  def show
    @user = User.find params[:id]
  end

  def logout
    session[:user_id] = nil
    redirect_to sign_in_users_path
    flash[:txt] = "Successfully logged out"
  end

  def params_user
    params.require(:user).permit!
  end
end
