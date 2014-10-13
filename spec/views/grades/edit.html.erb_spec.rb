require 'spec_helper'

describe "grades/edit" do
  before(:each) do
    @grade = assign(:grade, stub_model(Grade,
      :gradevalue => "MyString",
      :minrange => 1,
      :maxrange => 1
    ))
  end

  it "renders the edit grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do
      assert_select "input#grade_gradevalue[name=?]", "grade[gradevalue]"
      assert_select "input#grade_minrange[name=?]", "grade[minrange]"
      assert_select "input#grade_maxrange[name=?]", "grade[maxrange]"
    end
  end
end
