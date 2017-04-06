require 'test_helper'

class SoundsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
    @sound = sounds(:one)
  end

  test "should get index" do
    get :index, params: { location_id: @location }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { location_id: @location }
    assert_response :success
  end

  test "should create sound" do
    assert_difference('Sound.count') do
      post :create, params: { location_id: @location, sound: @sound.attributes }
    end

    assert_redirected_to location_sound_path(@location, Sound.last)
  end

  test "should show sound" do
    get :show, params: { location_id: @location, id: @sound }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { location_id: @location, id: @sound }
    assert_response :success
  end

  test "should update sound" do
    put :update, params: { location_id: @location, id: @sound, sound: @sound.attributes }
    assert_redirected_to location_sound_path(@location, Sound.last)
  end

  test "should destroy sound" do
    assert_difference('Sound.count', -1) do
      delete :destroy, params: { location_id: @location, id: @sound }
    end

    assert_redirected_to location_sounds_path(@location)
  end
end
