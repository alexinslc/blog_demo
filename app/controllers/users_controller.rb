class UsersController < ApplicationController
  before_action :set_user
  def profile
    @user.update(views: @user.views + 1)
  end
end

private

def set_user
  @user = User.find(params[:id])
end