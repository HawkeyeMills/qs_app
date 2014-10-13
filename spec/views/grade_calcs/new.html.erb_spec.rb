require 'spec_helper'

describe "grade_calcs/new" do
  before(:each) do
    assign(:grade_calc, stub_model(GradeCalc,
      :gradecalc => "MyString"
    ).as_new_record)
  end

  it "renders new grade_calc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grade_calcs_path, "post" do
      assert_select "input#grade_calc_gradecalc[name=?]", "grade_calc[gradecalc]"
    end
  end
end
