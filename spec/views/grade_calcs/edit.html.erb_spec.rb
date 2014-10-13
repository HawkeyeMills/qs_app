require 'spec_helper'

describe "grade_calcs/edit" do
  before(:each) do
    @grade_calc = assign(:grade_calc, stub_model(GradeCalc,
      :gradecalc => "MyString"
    ))
  end

  it "renders the edit grade_calc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grade_calc_path(@grade_calc), "post" do
      assert_select "input#grade_calc_gradecalc[name=?]", "grade_calc[gradecalc]"
    end
  end
end
