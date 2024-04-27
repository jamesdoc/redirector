class DashboardsController < ApplicationController
  before_action :authenticate_user!


  def index

    @user = current_user
    @links = Link.on_account(@user.account).all
    @link = Link.new

  end
end
