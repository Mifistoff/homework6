require "rails_helper"

RSpec.describe Admin::CommentsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/admin/comments").to route_to("admin/comments#create")
    end
  end
end
