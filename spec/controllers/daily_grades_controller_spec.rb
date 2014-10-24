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

describe DailyGradesController do

  # This should return the minimal set of attributes required to create a valid
  # DailyGrade. As you add validations to DailyGrade, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "grade_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DailyGradesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all daily_grades as @daily_grades" do
      daily_grade = DailyGrade.create! valid_attributes
      get :index, {}, valid_session
      assigns(:daily_grades).should eq([daily_grade])
    end
  end

  describe "GET show" do
    it "assigns the requested daily_grade as @daily_grade" do
      daily_grade = DailyGrade.create! valid_attributes
      get :show, {:id => daily_grade.to_param}, valid_session
      assigns(:daily_grade).should eq(daily_grade)
    end
  end

  describe "GET new" do
    it "assigns a new daily_grade as @daily_grade" do
      get :new, {}, valid_session
      assigns(:daily_grade).should be_a_new(DailyGrade)
    end
  end

  describe "GET edit" do
    it "assigns the requested daily_grade as @daily_grade" do
      daily_grade = DailyGrade.create! valid_attributes
      get :edit, {:id => daily_grade.to_param}, valid_session
      assigns(:daily_grade).should eq(daily_grade)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DailyGrade" do
        expect {
          post :create, {:daily_grade => valid_attributes}, valid_session
        }.to change(DailyGrade, :count).by(1)
      end

      it "assigns a newly created daily_grade as @daily_grade" do
        post :create, {:daily_grade => valid_attributes}, valid_session
        assigns(:daily_grade).should be_a(DailyGrade)
        assigns(:daily_grade).should be_persisted
      end

      it "redirects to the created daily_grade" do
        post :create, {:daily_grade => valid_attributes}, valid_session
        response.should redirect_to(DailyGrade.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved daily_grade as @daily_grade" do
        # Trigger the behavior that occurs when invalid params are submitted
        DailyGrade.any_instance.stub(:save).and_return(false)
        post :create, {:daily_grade => { "grade_id" => "invalid value" }}, valid_session
        assigns(:daily_grade).should be_a_new(DailyGrade)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DailyGrade.any_instance.stub(:save).and_return(false)
        post :create, {:daily_grade => { "grade_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested daily_grade" do
        daily_grade = DailyGrade.create! valid_attributes
        # Assuming there are no other daily_grades in the database, this
        # specifies that the DailyGrade created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DailyGrade.any_instance.should_receive(:update).with({ "grade_id" => "" })
        put :update, {:id => daily_grade.to_param, :daily_grade => { "grade_id" => "" }}, valid_session
      end

      it "assigns the requested daily_grade as @daily_grade" do
        daily_grade = DailyGrade.create! valid_attributes
        put :update, {:id => daily_grade.to_param, :daily_grade => valid_attributes}, valid_session
        assigns(:daily_grade).should eq(daily_grade)
      end

      it "redirects to the daily_grade" do
        daily_grade = DailyGrade.create! valid_attributes
        put :update, {:id => daily_grade.to_param, :daily_grade => valid_attributes}, valid_session
        response.should redirect_to(daily_grade)
      end
    end

    describe "with invalid params" do
      it "assigns the daily_grade as @daily_grade" do
        daily_grade = DailyGrade.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DailyGrade.any_instance.stub(:save).and_return(false)
        put :update, {:id => daily_grade.to_param, :daily_grade => { "grade_id" => "invalid value" }}, valid_session
        assigns(:daily_grade).should eq(daily_grade)
      end

      it "re-renders the 'edit' template" do
        daily_grade = DailyGrade.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DailyGrade.any_instance.stub(:save).and_return(false)
        put :update, {:id => daily_grade.to_param, :daily_grade => { "grade_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested daily_grade" do
      daily_grade = DailyGrade.create! valid_attributes
      expect {
        delete :destroy, {:id => daily_grade.to_param}, valid_session
      }.to change(DailyGrade, :count).by(-1)
    end

    it "redirects to the daily_grades list" do
      daily_grade = DailyGrade.create! valid_attributes
      delete :destroy, {:id => daily_grade.to_param}, valid_session
      response.should redirect_to(daily_grades_url)
    end
  end

end
