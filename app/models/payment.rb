class Payment < ApplicationRecord
  belongs_to :patient

  scope :filter_by_patient_id_if_present, ->(patient_id) { where("patient_id = ?", patient_id) unless patient_id.nil? }
end
