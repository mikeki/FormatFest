require 'test_helper'

class LaptopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laptops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laptop" do
    assert_difference('Laptop.count') do
      post :create, :laptop => { }
    end

    assert_redirected_to laptop_path(assigns(:laptop))
  end

  test "should show laptop" do
    get :show, :id => laptops(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => laptops(:one).to_param
    assert_response :success
  end

  test "should update laptop" do
    put :update, :id => laptops(:one).to_param, :laptop => { }
    assert_redirected_to laptop_path(assigns(:laptop))
  end

  test "should destroy laptop" do
    assert_difference('Laptop.count', -1) do
      delete :destroy, :id => laptops(:one).to_param
    end

    assert_redirected_to laptops_path
  end
end
