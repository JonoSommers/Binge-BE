require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "POST /api/v1/users Happy Paths" do
    context "When valid credintials are provided" do
      it "Creates a new user" do
        post api_v1_users_path, params: {
          username: "test_user",
          password: "Password123!",
          password_confirmation: "Password123!"
        }

        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to have_key(:data)
        expect(json[:data]).to include(:id, :type, :attributes)
        expect(json[:data][:type]).to eq("user")
        expect(json[:data][:attributes]).to include(username: "test_user")
      end
    end
  end
end
