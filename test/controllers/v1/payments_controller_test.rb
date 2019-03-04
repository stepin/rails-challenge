require 'test_helper'

module V1
  class PaymentsControllerTest < ActionDispatch::IntegrationTest

    test "simple get payments" do
      get v1_payments_path

      assert_response :success

      response = JSON.parse(@response.body)
      assert 3 == response.length
    end

    test "get payments for first patient" do
      get v1_payments_path, params:{ external_id: patients[0].external_id }

      assert_response :success

      response = JSON.parse(@response.body)
      assert 2 == response.length
    end

    test "get payments for non-existing patient" do
      get v1_payments_path, params:{ external_id: "C" }

      assert_response :success

      response = JSON.parse(@response.body)
      assert 0 == response.length
    end

    test "simple import payments" do
      body = File.read('patients.json')
      post v1_payments_path, params: {body: body, as: :json}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 'OK', response['status']
    end
  end
end
