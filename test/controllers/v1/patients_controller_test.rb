require 'test_helper'

module V1
  class PatientsControllerTest < ActionDispatch::IntegrationTest

    test "simple get patients" do
      get v1_patients_path

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 50 == response[0]["total_amount"] || 7 == response[0]["total_amount"]
      assert 50 == response[1]["total_amount"] || 7 == response[1]["total_amount"]
    end

    test "get patients with payment_min (edge)" do
      get v1_patients_path, params: { payment_min: 10}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 50 == response[0]["total_amount"] || 0 == response[0]["total_amount"]
      assert 50 == response[1]["total_amount"] || 0 == response[1]["total_amount"]
    end

    test "get patients with payment_min" do
      get v1_patients_path, params: { payment_min: 11}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 40 == response[0]["total_amount"] || 0 == response[0]["total_amount"]
      assert 40 == response[1]["total_amount"] || 0 == response[1]["total_amount"]
    end

    test "get patients with payment_max (edge)" do
      get v1_patients_path, params: { payment_max: 40}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 50 == response[0]["total_amount"] || 7 == response[0]["total_amount"]
      assert 50 == response[1]["total_amount"] || 7 == response[1]["total_amount"]
    end

    test "get patients with payment_max" do
      get v1_patients_path, params: { payment_max: 39}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 10 == response[0]["total_amount"] || 7 == response[0]["total_amount"]
      assert 10 == response[1]["total_amount"] || 7 == response[1]["total_amount"]
    end

    test "get patients with payment_min and payment_max" do
      get v1_patients_path, params: { payment_min: 20, payment_max: 30}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 2, response.length
      assert_not_nil response[0]["total_amount"]
      assert 0 == response[0]["total_amount"]
      assert 0 == response[1]["total_amount"]
    end

    test "simple import patients" do
      body = File.read('patients.json')
      post v1_patients_path, params: {body: body, as: :json}

      assert_response :success

      response = JSON.parse(@response.body)
      assert_equal 'OK', response['status']
    end
  end
end
