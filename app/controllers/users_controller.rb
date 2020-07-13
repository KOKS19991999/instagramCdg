class UsersController < ApplicationController

  def show
    @users = User.find(params[:username])

@posts = Post.all
end



end
