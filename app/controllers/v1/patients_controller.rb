module V1
  class PatientsController < ApplicationController

    def index
      @patients = Patient
          .select('patients.*, IFNULL(SUM(payments.amount),0) AS total_amount')
          .joins("LEFT OUTER JOIN payments ON (patients.id = payments.patient_id" + extra_join_sql + ")")
          .group('patients.id')
          .all
    end

    def import
      render json: {'status': 'OK'}
    end

    private

    def extra_join_sql
      payment_min = params['payment_min']
      payment_max = params['payment_max']
      extra_join_sql = ""
      extra_join_sql += " AND payments.amount >= " + payment_min.to_i.to_s if payment_min
      extra_join_sql += " AND payments.amount <= " + payment_max.to_i.to_s if payment_max
      extra_join_sql
    end
  end
end
