class ErrorsController < ApplicationController
  def not_found
    #apparently best practice is to ensure the status is included in the response
    render status: 404
  end

  def internal_server_error
    render status: 500
  end
end
