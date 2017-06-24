require 'rails_helper'

RSpec.describe Admin::TasksController, type: :controller do
  let(:admin)              { create :admin }
  let!(:task)              { create :task, admin: admin }
  let(:valid_attributes)   { { status: Task.statuses[:closed] } }
  let(:invalid_attributes) { { status: 'asdfasf' } }
  let(:valid_session)      { {} }

  before { sign_in admin }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(assigns(:tasks).count).to eq(Task.count)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: task.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested task" do
        put :update, params: {id: task.to_param, task: valid_attributes}, session: valid_session
        task.reload
        expect(task.read_attribute_before_type_cast(:status)).to eq(valid_attributes[:status])
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "redirect to dashboard page" do
        expect{
          put :update, params: {id: task.to_param, task: {} }, session: valid_session
        }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
