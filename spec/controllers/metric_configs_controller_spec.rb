require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MetricConfigsController do

  # This should return the minimal set of attributes required to create a valid
  # MetricConfig. As you add validations to MetricConfig, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MetricConfigsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all metric_configs as @metric_configs" do
      metric_config = MetricConfig.create! valid_attributes
      get :index, {}, valid_session
      assigns(:metric_configs).should eq([metric_config])
    end
  end

  describe "GET show" do
    it "assigns the requested metric_config as @metric_config" do
      metric_config = MetricConfig.create! valid_attributes
      get :show, {:id => metric_config.to_param}, valid_session
      assigns(:metric_config).should eq(metric_config)
    end
  end

  describe "GET new" do
    it "assigns a new metric_config as @metric_config" do
      get :new, {}, valid_session
      assigns(:metric_config).should be_a_new(MetricConfig)
    end
  end

  describe "GET edit" do
    it "assigns the requested metric_config as @metric_config" do
      metric_config = MetricConfig.create! valid_attributes
      get :edit, {:id => metric_config.to_param}, valid_session
      assigns(:metric_config).should eq(metric_config)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MetricConfig" do
        expect {
          post :create, {:metric_config => valid_attributes}, valid_session
        }.to change(MetricConfig, :count).by(1)
      end

      it "assigns a newly created metric_config as @metric_config" do
        post :create, {:metric_config => valid_attributes}, valid_session
        assigns(:metric_config).should be_a(MetricConfig)
        assigns(:metric_config).should be_persisted
      end

      it "redirects to the created metric_config" do
        post :create, {:metric_config => valid_attributes}, valid_session
        response.should redirect_to(MetricConfig.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved metric_config as @metric_config" do
        # Trigger the behavior that occurs when invalid params are submitted
        MetricConfig.any_instance.stub(:save).and_return(false)
        post :create, {:metric_config => { "user_id" => "invalid value" }}, valid_session
        assigns(:metric_config).should be_a_new(MetricConfig)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MetricConfig.any_instance.stub(:save).and_return(false)
        post :create, {:metric_config => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested metric_config" do
        metric_config = MetricConfig.create! valid_attributes
        # Assuming there are no other metric_configs in the database, this
        # specifies that the MetricConfig created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MetricConfig.any_instance.should_receive(:update).with({ "user_id" => "1" })
        put :update, {:id => metric_config.to_param, :metric_config => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested metric_config as @metric_config" do
        metric_config = MetricConfig.create! valid_attributes
        put :update, {:id => metric_config.to_param, :metric_config => valid_attributes}, valid_session
        assigns(:metric_config).should eq(metric_config)
      end

      it "redirects to the metric_config" do
        metric_config = MetricConfig.create! valid_attributes
        put :update, {:id => metric_config.to_param, :metric_config => valid_attributes}, valid_session
        response.should redirect_to(metric_config)
      end
    end

    describe "with invalid params" do
      it "assigns the metric_config as @metric_config" do
        metric_config = MetricConfig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MetricConfig.any_instance.stub(:save).and_return(false)
        put :update, {:id => metric_config.to_param, :metric_config => { "user_id" => "invalid value" }}, valid_session
        assigns(:metric_config).should eq(metric_config)
      end

      it "re-renders the 'edit' template" do
        metric_config = MetricConfig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MetricConfig.any_instance.stub(:save).and_return(false)
        put :update, {:id => metric_config.to_param, :metric_config => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested metric_config" do
      metric_config = MetricConfig.create! valid_attributes
      expect {
        delete :destroy, {:id => metric_config.to_param}, valid_session
      }.to change(MetricConfig, :count).by(-1)
    end

    it "redirects to the metric_configs list" do
      metric_config = MetricConfig.create! valid_attributes
      delete :destroy, {:id => metric_config.to_param}, valid_session
      response.should redirect_to(metric_configs_url)
    end
  end

end
