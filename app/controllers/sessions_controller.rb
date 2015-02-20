class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      if not user.enabled?
        redirect_to signin_path, alert:'Your account is disabled, please contact the administrator!'
      else
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome back!"
      end
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def create_oauth
    nick = env["omniauth.auth"].info.nickname
    user = User.find_by username: nick
    if not user
      rand = (('0'..'9').to_a+('a'..'z').to_a+('A'..'Z').to_a).shuffle.first(60).join
      user = User.create username:nick, password:rand, enabled:true, admin:false
      user.save
    end
    if user.id
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "User not found"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
