# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let!(:current_user) { create(:user) }

  describe 'GET #index' do
    before do
      create_list(:course, 2, user: current_user)
      get :index
    end

    it 'returns a success response' do
      expect(response).to be_successful
      expect(parsed_response.size).to eq(2)
    end
  end

  describe 'PUT #sort' do
    let(:courses) { create_list(:course, 3, user: current_user) }
    let(:ids) { courses.map(&:id) }

    before do
      put :sort, params: { ids: ids.reverse }
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'updates the priority of the courses' do
      expect(Course.order(:priority).pluck(:id)).to eq(ids.reverse)
    end
  end

  describe "GET #show" do
    let(:course) { create(:course, user: current_user) }

    before do
      get :show, params: { id: course.id }
    end

    it "returns a success response" do
      expect(response).to be_successful
      expect(parsed_response["id"]).to eq(course.id)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:course_params) { attributes_for(:course) }

      it "creates a new Course" do
        expect {
          post :create, params: { course: course_params }
        }.to change(Course, :count).by(1)
      end

      it "renders a JSON response with the new course" do
        post :create, params: { course: course_params }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new course" do
        post :create, params: { course: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response["errors"]["name"]).to include("can't be blank")
      end
    end
  end

  describe "PUT #update" do
    let(:course) { create(:course, user: current_user) }

    context "with valid params" do
      let(:new_attributes) { attributes_for(:course) }

      before do
        put :update, params: { id: course.id, course: new_attributes }
      end

      it "updates the requested course" do
        course.reload
        expect(course.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the course" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      before do
        put :update, params: { id: course.id, course: { name: nil } }
      end

      it "renders a JSON response with errors for the course" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response["errors"]["name"]).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:course) { create(:course, user: current_user) }

    it "destroys the requested course" do
      expect {
        delete :destroy, params: { id: course.id }
      }.to change(Course, :count).by(-1)
    end

    it "renders a JSON response with the course" do
      delete :destroy, params: { id: course.id }
      expect(response).to have_http_status(:ok)
      expect(parsed_response["message"]).to eq("Course deleted")
    end
  end

end
