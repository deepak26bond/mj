class UsersController < ApplicationController
  def admin_login
  end
def admin_auth
 pass=params[:admin_pass][:password]
 if pass=="admin"
   session[:admin]=true
 redirect_to "/mjweller/item_detail"
 else
   session[:admin]=false
   redirect_to "/users/admin_login", error: "wrong password"
 end

end
def logout
  session[:admin]=false
  redirect_to "/mjweller/home"
end
end
