class ApplicationController < ActionController::API
  before_action :set_format

  protected

  def new_sync_id
    SecureRandom.hex(32)
  end

  def request_json
    request.body.rewind
    Yajl::Parser.parse request.body.read.html_safe
  end

  private

  def set_format
    request.format = 'json'
  end
end
