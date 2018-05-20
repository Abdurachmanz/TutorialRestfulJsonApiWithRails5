require "rails_helper"

RSpec.describe LukisansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lukisans").to route_to("lukisans#index")
    end


    it "routes to #show" do
      expect(:get => "/lukisans/1").to route_to("lukisans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/lukisans").to route_to("lukisans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lukisans/1").to route_to("lukisans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lukisans/1").to route_to("lukisans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lukisans/1").to route_to("lukisans#destroy", :id => "1")
    end

  end
end
