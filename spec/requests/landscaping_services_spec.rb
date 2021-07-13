require 'rails_helper'

RSpec.describe "LandscapingServices", type: :request do
  describe "GET /landscaping_services" do
    it "works! (now write some real specs)" do
      get landscaping_services_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "LandscapingServicesControllers", type: :request do
  describe "GET /landscaping_services" do
    it "renders the landscaping services view (index)" do
      FactoryBot.create_list(:landscaping_service, 10)
      get landscaping_services_path
      expect(response).to render_template(:index)
    end
  end
  describe "get landscaping service path" do
    it "renders the :show template" do
      landscaping_service = FactoryBot.create(:landscaping_service)
      get landscaping_service_path(id: landscaping_service.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the landscaping services (index) path if the landscaping service id is invalid" do
      get landscaping_service_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to landscaping_services_path
    end
  end
  describe "get new landscaping service path" do
    it "renders the :new template" do
      get new_landscaping_service_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit landscaping service path" do
    it "renders the :edit template" do
      landscaping_service = FactoryBot.create(:landscaping_service)
      get edit_landscaping_service_path(id: landscaping_service.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post landscaping service path with valid data" do
    it "saves a new landscaping service and redirects to the show path for the landscaping service" do
      senior = FactoryBot.create(:senior)
      landscaping_service_attributes = FactoryBot.attributes_for(:landscaping_service, senior_id: senior.id)
      expect { post landscaping_services_path, params: {landscaping_service: landscaping_service_attributes} }.to change(LandscapingService, :count)
      expect(response).to redirect_to landscaping_service_path(id: LandscapingService.last.senior_id)
    end
  end
  describe "post landscaping service path with invalid data" do
     it "does not save a new landscaping service or redirect if invalid senior id" do
       senior = FactoryBot.create(:senior)
       landscaping_service_attributes = FactoryBot.attributes_for(:landscaping_service, senior_id: senior.id)
       landscaping_service_attributes.delete(:senior_id)
       expect { post landscaping_services_path, params: {landscaping_service: landscaping_service_attributes} }.to_not change(LandscapingService, :count)
       expect(response).to render_template(:new)
     end
     it "does not save a new landscaping service or redirect if invalid landscape service" do
       senior = FactoryBot.create(:senior)
       landscaping_service_attributes = FactoryBot.attributes_for(:landscaping_service, senior_id: senior.id)
       landscaping_service_attributes.delete(:landscape_service)
       expect { post landscaping_services_path, params: {landscaping_service: landscaping_service_attributes} }.to_not change(LandscapingService, :count)
       expect(response).to render_template(:new)
     end
     it "does not save a new landscaping service or redirect if invalid fee per hour" do
       senior = FactoryBot.create(:senior)
       landscaping_service_attributes = FactoryBot.attributes_for(:landscaping_service, senior_id: senior.id)
       landscaping_service_attributes.delete(:fee_per_hour)
       expect { post landscaping_services_path, params: {landscaping_service: landscaping_service_attributes} }.to_not change(LandscapingService, :count)
       expect(response).to render_template(:new)
     end
     it "does not save a new landscaping service or redirect if invalid date and time" do
       senior = FactoryBot.create(:senior)
       landscaping_service_attributes = FactoryBot.attributes_for(:landscaping_service, senior_id: senior.id)
       landscaping_service_attributes.delete(:date_time)
       expect { post landscaping_services_path, params: {landscaping_service: landscaping_service_attributes} }.to_not change(LandscapingService, :count)
       expect(response).to render_template(:new)
     end
  end





  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the customer" do
      order = FactoryBot.create(:order)
      put "/orders/#{order.id}", params: {order: {product_count: 50}}
      order.reload
      expect(order.product_count).to eq(50)
      expect(response).to redirect_to("/orders/#{order.id}")
    end
  end
  describe "put order_path with invalid data" do
    it "does not update the customer record or redirect" do
      order = FactoryBot.create(:order)
      put "/orders/#{order.id}", params: {order: {customer_id: 5001}}
      order.reload
      expect(order.customer_id).not_to eq(5001)
      expect(response).to render_template(:edit)
    end
  end
  describe "delete an order record" do
    it "deletes an order record" do
      order = FactoryBot.create(:order)
      delete order_path(order.id)
      expect(response).to redirect_to orders_path
    end
  end
end
