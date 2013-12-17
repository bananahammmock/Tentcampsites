require 'test_helper'

class CampsitesControllerTest < ActionController::TestCase
  setup do
    @campsite = campsites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campsite" do
    assert_difference('Campsite.count') do
      post :create, campsite: { description: @campsite.description, name: @campsite.name, region_id: @campsite.region_id, state_id: @campsite.state_id }
    end

    assert_redirected_to campsite_path(assigns(:campsite))
  end

  test "should show campsite" do
    get :show, id: @campsite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campsite
    assert_response :success
  end

  test "should update campsite" do
    patch :update, id: @campsite, campsite: { description: @campsite.description, name: @campsite.name, region_id: @campsite.region_id, state_id: @campsite.state_id }
    assert_redirected_to campsite_path(assigns(:campsite))
  end

  test "should destroy campsite" do
    assert_difference('Campsite.count', -1) do
      delete :destroy, id: @campsite
    end

    assert_redirected_to campsites_path
  end
end
