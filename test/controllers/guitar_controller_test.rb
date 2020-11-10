require 'test_helper'

class GuitarControllerTest < ActionDispatch::IntegrationTest
  test "should get brand" do
    get guitar_brand_url
    assert_response :success
  end

  test "should get model" do
    get guitar_model_url
    assert_response :success
  end

  test "should get year" do
    get guitar_year_url
    assert_response :success
  end

  test "should get price" do
    get guitar_price_url
    assert_response :success
  end

end
