require 'test_helper'

module V1
  class PatientsControllerTest < ActionDispatch::IntegrationTest

    test "simple get patients" do
      get v1_patients_path

      assert_response :success

      response = JSON.parse(@response.body)
      assert 3 == response.length
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
