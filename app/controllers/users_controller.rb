class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   if params['username']
     @user = User.create!(
       username: params[:username],
       email: params[:email],
       bio: params[:bio]
       )
   elsif params['user']['username']
     @user = User.create(
       username: params["user"]["username"],
       email: params["user"]["email"],
       bio: params["user"]["bio"]
       )
   end
  end

end

#Dans la méthode create le if et le elsif permettent de faire fonctionner à la fois form_tag et form_for
#Du coup, on va appliquer d'abord le params de base (params[:username]) et sinon le params qui s'adapte
#au hash généré par form_for, grâce au elsif
