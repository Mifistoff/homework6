require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/api/v1/comments").to route_to("api/v1/comments#create")
    end
  end
end
