json.array!(@patients) do |patient|
  json.extract! patient, :external_id, :id, :first_name, :last_name, :middle_name, :date_of_birth, :total_amount
end
