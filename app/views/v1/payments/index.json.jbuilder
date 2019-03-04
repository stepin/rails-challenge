json.array!(@payments) do |payment|
  json.extract! payment, :external_id, :patient_id, :amount
end
