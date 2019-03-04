# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Test data

    p1 = Patient.create first_name:"AF", last_name:"AL", external_id:"A"
    p2 = Patient.create first_name:"BF", last_name:"BL", external_id:"B"
    
    pay1 = Payment.create external_id:"a1", amount:10, patient_id:1
    pay2 = Payment.create external_id:"a2", amount:40, patient_id:1
    pay3 = Payment.create external_id:"b1", amount:7, patient_id:2
