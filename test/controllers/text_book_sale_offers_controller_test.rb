require 'test_helper'

class TextBookSaleOffersControllerTest < ActionController::TestCase
  setup do
    @text_book_sale_offer = text_book_sale_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_book_sale_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_book_sale_offer" do
    assert_difference('TextBookSaleOffer.count') do
      post :create, text_book_sale_offer: {  }
    end

    assert_redirected_to text_book_sale_offer_path(assigns(:text_book_sale_offer))
  end

  test "should show text_book_sale_offer" do
    get :show, id: @text_book_sale_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_book_sale_offer
    assert_response :success
  end

  test "should update text_book_sale_offer" do
    patch :update, id: @text_book_sale_offer, text_book_sale_offer: {  }
    assert_redirected_to text_book_sale_offer_path(assigns(:text_book_sale_offer))
  end

  test "should destroy text_book_sale_offer" do
    assert_difference('TextBookSaleOffer.count', -1) do
      delete :destroy, id: @text_book_sale_offer
    end

    assert_redirected_to text_book_sale_offers_path
  end
end
