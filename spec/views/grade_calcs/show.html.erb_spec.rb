require 'spec_helper'

describe "grade_calcs/show" do
  before(:each) do
    @grade_calc = assign(:grade_calc, stub_model(GradeCalc,
      :gradecalc => "Gradecalc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gradecalc/)
  end
end
