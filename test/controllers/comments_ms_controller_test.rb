require "test_helper"

class CommentsMsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comments_m = comments_ms(:one)
  end

  test "should get index" do
    get comments_ms_url
    assert_response :success
  end

  test "should get new" do
    get new_comments_m_url
    assert_response :success
  end

  test "should create comments_m" do
    assert_difference("CommentsM.count") do
      post comments_ms_url, params: { comments_m: { body: @comments_m.body } }
    end

    assert_redirected_to comments_m_url(CommentsM.last)
  end

  test "should show comments_m" do
    get comments_m_url(@comments_m)
    assert_response :success
  end

  test "should get edit" do
    get edit_comments_m_url(@comments_m)
    assert_response :success
  end

  test "should update comments_m" do
    patch comments_m_url(@comments_m), params: { comments_m: { body: @comments_m.body } }
    assert_redirected_to comments_m_url(@comments_m)
  end

  test "should destroy comments_m" do
    assert_difference("CommentsM.count", -1) do
      delete comments_m_url(@comments_m)
    end

    assert_redirected_to comments_ms_url
  end
end
