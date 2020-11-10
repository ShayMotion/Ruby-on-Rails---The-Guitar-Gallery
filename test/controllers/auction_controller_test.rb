require 'test_helper'

class AuctionControllerTest < ActionDispatch::IntegrationTest
  test "should get title" do
    get auction_title_url
    assert_response :success
  end

  test "should get start_date" do
    get auction_start_date_url
    assert_response :success
  end

  test "should get end_date" do
    get auction_end_date_url
    assert_response :success
  end

end
