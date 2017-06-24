require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let!(:first_user)  { create :user }
  let!(:second_user) { create :user }
  let!(:own_task)    { create :task, user: first_user }
  #don't do like that ))
  let!(:other_task)  { Task.create(title: "Title", body: 'asdf', user: second_user) }

  before {
    sign_in first_user
  }

  describe "GET #show" do
    it "returns a success response" do
      get :show
      @controller.instance_eval{ tasks }.should eq first_user.tasks
      expect(response).to be_success
    end
  end
end
