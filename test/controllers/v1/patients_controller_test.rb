require 'test_helper'

module V1
  class PatientsControllerTest < ActionDispatch::IntegrationTest
    # test "the truth" do
    #   assert true
    # end

    test "simple get patients" do
      get v1_patients_path

      assert_response :success

      response = JSON.parse(@response.body)
      assert 0 == response.length
    end
  end
end
