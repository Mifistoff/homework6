require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:user)          { create :user }
  let(:valid_task)    { create :task, user: user }
  let(:invalid_task)  { build  :task, :invalid }
  let(:valid_attributes) {
    {
      title: 'title',
      body:  'task body'
    }
  }
  let(:invalid_attributes) { {} }
  let(:valid_session) { {} }

  before { sign_in user }

  describe "GET #index" do
    before {
      valid_task
    }
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(assigns(:tasks).first.user).to eq(user)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: valid_task.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: {task: valid_attributes}, session: valid_session
        }.to change(Task, :count).by(1)
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid params" do
      it "returns a error response (i.e. to display the 'new' template)" do
        expect{ post(:create, invalid_attributes) }.to raise_error ActionController::ParameterMissing
      end
    end
  end
end
