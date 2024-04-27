class RedirectsController < ApplicationController
  def index
    token = params[:path]
    host = request.host

    ## TODO check host name

    @link = Link
      .on_host(host)
      .where("token = ?", token)
      .first

    if Rails.env.development?
      # render plain: @link.
    end

    if @link
      render json: @link
    else
      render plain: "NOPE"
    end


  end
end
