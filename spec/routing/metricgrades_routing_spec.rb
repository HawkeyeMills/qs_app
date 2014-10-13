require "spec_helper"

describe MetricgradesController do
  describe "routing" do

    it "routes to #index" do
      get("/metricgrades").should route_to("metricgrades#index")
    end

    it "routes to #new" do
      get("/metricgrades/new").should route_to("metricgrades#new")
    end

    it "routes to #show" do
      get("/metricgrades/1").should route_to("metricgrades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metricgrades/1/edit").should route_to("metricgrades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metricgrades").should route_to("metricgrades#create")
    end

    it "routes to #update" do
      put("/metricgrades/1").should route_to("metricgrades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metricgrades/1").should route_to("metricgrades#destroy", :id => "1")
    end

  end
end
