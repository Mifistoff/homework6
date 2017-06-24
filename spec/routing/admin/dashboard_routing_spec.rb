require "rails_helper"

RSpec.describe Admin::DashboardController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/admin").to route_to("admin/dashboard#show")
    end
  end
end
