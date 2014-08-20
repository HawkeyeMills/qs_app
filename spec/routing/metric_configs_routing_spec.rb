require "spec_helper"

describe MetricConfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/metric_configs").should route_to("metric_configs#index")
    end

    it "routes to #new" do
      get("/metric_configs/new").should route_to("metric_configs#new")
    end

    it "routes to #show" do
      get("/metric_configs/1").should route_to("metric_configs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metric_configs/1/edit").should route_to("metric_configs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metric_configs").should route_to("metric_configs#create")
    end

    it "routes to #update" do
      put("/metric_configs/1").should route_to("metric_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metric_configs/1").should route_to("metric_configs#destroy", :id => "1")
    end

  end
end
