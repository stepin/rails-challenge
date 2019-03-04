module V1
  class PaymentsController < ApplicationController

    def index
      render json: []
    end

    def import
      render json: {'status': 'OK'}
    end

    private
  end
end
