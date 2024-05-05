# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let!(:current_user) { create(:user) }

  describe "PUT #update" do

    context "with valid params" do
      let(:new_attributes) { { name: "New Name", slots: Array.new(7, 1), timer_duration: 20 } }

      before do
        put :update, params: { id: current_user.id }.merge(new_attributes)
      end

      it "updates the requested course" do
        current_user.reload
        expect(current_user.slots).to eq(new_attributes[:slots])
        expect(current_user.name).to eq(new_attributes[:name])
        expect(current_user.timer_duration).to eq(new_attributes[:timer_duration])
      end

      it "renders a JSON response with the course" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      before do
        put :update, params: { id: current_user.id, timer_duration: 0 }
      end

      it "renders a JSON response with errors for the course" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response["errors"]["timer_duration"]).to include("must be greater than 0")
      end
    end

    context "with invalid user id" do
      before do
        put :update, params: { id: 0, timer_duration: 20 }
      end

      it "renders a JSON response with errors for the course" do
        expect(response).to have_http_status(:unauthorized)
        expect(parsed_response["errors"]["base"]).to include("You can only update current user")
      end
    end
  end
end
