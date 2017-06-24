require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  let(:admin)              { create :admin }
  let!(:task)              { create :task, admin: admin }

  before { sign_in admin }

  describe "GET #show" do
    it "returns a success response" do
      get :show
      @controller.instance_eval{ tasks }.should eq Task.all
      expect(response).to be_success
    end
  end
end
