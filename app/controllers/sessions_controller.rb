class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    render :text => auth_hash.to_json
  end

  def failure
    render :text=> "Sorry, nu ne-ai dat acces prin aplicatie:("
  end
end
