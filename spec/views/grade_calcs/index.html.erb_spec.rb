require 'spec_helper'

describe "grade_calcs/index" do
  before(:each) do
    assign(:grade_calcs, [
      stub_model(GradeCalc,
        :gradecalc => "Gradecalc"
      ),
      stub_model(GradeCalc,
        :gradecalc => "Gradecalc"
      )
    ])
  end

  it "renders a list of grade_calcs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gradecalc".to_s, :count => 2
  end
end
