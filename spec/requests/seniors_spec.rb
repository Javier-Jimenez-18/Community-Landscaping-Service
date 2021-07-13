require 'rails_helper'

RSpec.describe "Seniors", type: :request do
  describe "GET /seniors" do
    it "works! (now write some real specs)" do
      get seniors_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "SeniorsControllers", type: :request do
  describe "get seniors_path" do
    it "renders the index view" do
      FactoryBot.create_list(:senior, 10)
      get seniors_path
      expect(response).to render_template(:index)
    end
  end
  describe "get senior_path" do
    it "renders the :show template" do
      senior = FactoryBot.create(:senior)
      get senior_path(id: senior.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the senior id is invalid" do
      get senior_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to seniors_path
    end
  end
  describe "get new_senior_path" do
    it "renders the :new template" do
      get new_senior_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_senior_path" do
    it "renders the :edit template" do
      senior = FactoryBot.create(:senior)
      get edit_senior_path(id: senior.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post seniors_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      senior_attributes = FactoryBot.attributes_for(:senior)
      expect { post seniors_path, params: {senior: senior_attributes} }.to change(Senior, :count)
      expect(response).to redirect_to senior_path(id: Senior.last.id)
    end
  end
  describe "post seniors_path with invalid data" do
    it "does not save a new entry or redirect" do
      senior_attributes = FactoryBot.attributes_for(:senior)
      senior_attributes.delete(:first_name)
      expect { post seniors_path, params: {senior: senior_attributes} }.to_not change(Senior, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put senior_path with valid data" do
    it "updates an entry and redirects to the show path for the senior" do
      senior = FactoryBot.create(:senior)
      put senior_path(senior.id), params: { senior: {phone: "0123456789"} }
      senior.reload
      expect(senior.phone).to eq("0123456789")
      expect(response).to redirect_to senior_path(id: Senior.last.id)
    end
  end
  describe "put senior_path with invalid data" do
    it "does not update the senior record or redirect" do
      senior = FactoryBot.create(:senior)
      put senior_path(senior.id), params: { senior: {phone: "123"} }
      senior.reload
      expect(senior.phone).not_to eq("123")
      expect(response).to render_template(:edit)
    end
  end
  describe "delete a senior record" do
    it "deletes a senior record" do
      senior = FactoryBot.create(:senior)
      delete senior_path(senior.id)
      expect(response).to redirect_to seniors_path
    end
  end
end
