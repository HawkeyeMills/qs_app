require 'spec_helper'

describe "daily_grades/index" do
  before(:each) do
    assign(:daily_grades, [
      stub_model(DailyGrade,
        :grade_id => "",
        :points => "",
        :possible => ""
      ),
      stub_model(DailyGrade,
        :grade_id => "",
        :points => "",
        :possible => ""
      )
    ])
  end

  it "renders a list of daily_grades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
