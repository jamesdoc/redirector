class ConfigController < ApplicationController
  before_action :authenticate_user!

  def index

    @user = current_user
    @account = @user.account

    @account_users = User.where(account: @account)

  end
end
