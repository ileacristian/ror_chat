class SessionsController < ApplicationController
  layout "sessions_layout"
  skip_filter :authenticate

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      session[:user_id] = @authorization.user.id
      session[:user_avatar] = auth_hash[:info][:image]
      redirect_to root_path
    else
      user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      Authorization.create :provider => auth_hash["provider"], :uid => auth_hash["uid"], :user_id => user.id
      Settings.create :user_id => user.id
      session[:user_id] = user.id
      session[:user_avatar] = auth_hash[:info][:image]

      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_avatar] = nil
    render :logout
  end

  def failure
    render :text=> "Sorry, nu ne-ai dat acces prin aplicatie:("
  end

  def signup
  end

  def create_user
  end
  
  def new_no_social_login
  end

  def no_social_login
  end
end
