require "spec_helper"

describe MetricconfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/metricconfigs").should route_to("metricconfigs#index")
    end

    it "routes to #new" do
      get("/metricconfigs/new").should route_to("metricconfigs#new")
    end

    it "routes to #show" do
      get("/metricconfigs/1").should route_to("metricconfigs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metricconfigs/1/edit").should route_to("metricconfigs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metricconfigs").should route_to("metricconfigs#create")
    end

    it "routes to #update" do
      put("/metricconfigs/1").should route_to("metricconfigs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metricconfigs/1").should route_to("metricconfigs#destroy", :id => "1")
    end

  end
end
