# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Patient.create first_name:"AF", last_name:"AL", external_id:"A"
p2 = Patient.create first_name:"BF", last_name:"BL", external_id:"B"

Payment.create external_id:"a1", amount:10, patient_id: p1.id
Payment.create external_id:"a2", amount:40, patient_id: p1.id
Payment.create external_id:"b1", amount:7, patient_id: p2.id
