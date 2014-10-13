require "spec_helper"

describe MetricGradesController do
  describe "routing" do

    it "routes to #index" do
      get("/metric_grades").should route_to("metric_grades#index")
    end

    it "routes to #new" do
      get("/metric_grades/new").should route_to("metric_grades#new")
    end

    it "routes to #show" do
      get("/metric_grades/1").should route_to("metric_grades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metric_grades/1/edit").should route_to("metric_grades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metric_grades").should route_to("metric_grades#create")
    end

    it "routes to #update" do
      put("/metric_grades/1").should route_to("metric_grades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metric_grades/1").should route_to("metric_grades#destroy", :id => "1")
    end

  end
end
