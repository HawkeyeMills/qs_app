require "spec_helper"

describe GradeConfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/grade_configs").should route_to("grade_configs#index")
    end

    it "routes to #new" do
      get("/grade_configs/new").should route_to("grade_configs#new")
    end

    it "routes to #show" do
      get("/grade_configs/1").should route_to("grade_configs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/grade_configs/1/edit").should route_to("grade_configs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/grade_configs").should route_to("grade_configs#create")
    end

    it "routes to #update" do
      put("/grade_configs/1").should route_to("grade_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/grade_configs/1").should route_to("grade_configs#destroy", :id => "1")
    end

  end
end
