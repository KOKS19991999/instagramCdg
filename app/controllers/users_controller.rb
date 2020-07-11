class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @images = @user.images.order(created_at: :desc)
  end
end
