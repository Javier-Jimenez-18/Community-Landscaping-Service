require 'rails_helper'

RSpec.describe "User Sign in", type: :request do
  describe "GET /users/sign_in" do
    it "works! returns status code 200 (OK) (now write some real specs)" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "UsersControllers", type: :request do
  describe "GET user registration path" do
    it "renders the user registration view" do
      get new_user_registration_path
      expect(response).to render_template(:new)
    end
  end
  describe "GET user edit registration path" do
    it "redirect to users sign in" do
      get edit_user_registration_path
      expect(response).to redirect_to new_user_session_path
    end
  end
  describe "GET user sign in path" do
    it "renders the user sign in view" do
      get new_user_session_path
      expect(response).to render_template(:new)
    end
  end
  describe "delete a user session (user sign out path)" do
    it "renders the Community Landscaping Service Project home page view" do
      delete destroy_user_session_path
      expect(response).to redirect_to root_path # /home/index
    end
  end
  describe "post users path with valid data" do
    it "saves a new user and returns status code 200 (OK)" do
      user_attributes = FactoryBot.attributes_for(:user)
      expect { post user_session_path, params: {user: user_attributes} }.to_not change(User, :password_length)
      expect(response).to have_http_status(200)
    end
  end
  describe "post users path with invalid data" do
    it "does not saves a new user or redirect" do
      user_attributes = FactoryBot.attributes_for(:user)
      user_attributes.delete(:email)
      expect { post user_session_path, params: {user: user_attributes} }.to_not change(User, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put user path with valid data" do
    it "updates an entry and returns status code 200 (OK)" do
      user = FactoryBot.create(:user)
      put user_password_path, params: { user: {password: "012345abcd$"} }
      user.reload
      user = FactoryBot.create(:user)
      expect(user.password).to_not eq("012345abcd$")
      expect(response).to have_http_status(200)
    end
  end
  describe "put user path with invalid data" do
    it "does not update the user or redirect" do
      user = FactoryBot.create(:user)
      put user_password_path, params: { user: {password: "01234"} }
      user.reload
      expect(user.password).not_to eq("01234")
      expect(response).to render_template(:edit)
    end
  end
  describe "delete a user registration" do
    it "deletes a user registration" do
      user = FactoryBot.create(:user)
      delete user_registration_path
      expect(response).to redirect_to new_user_session_path
    end
  end
end
