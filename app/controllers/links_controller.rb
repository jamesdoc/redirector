class LinksController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @link = Link.on_account(@user.account).find(params[:id])
  end

  def create
    @user = current_user
    @link = Link.new(link_params)

    @link.account = @user.account

    if @link.save
      redirect_to @link
    else
      @links = Link.on_account(@user.account).all
      render 'dashboards/index', status: :unprocessable_entity
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :token, :redirect_type, :description)
    end
end
