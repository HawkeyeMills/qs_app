require 'spec_helper'

describe "grade_configs/index" do
  before(:each) do
    assign(:grade_configs, [
      stub_model(GradeConfig,
        :metricconfig_id => 1,
        :weight => "9.99",
        :percentoftotal => "9.99",
        :goal => "",
        :calcToUse => "",
        :type => "",
        :note => "MyText"
      ),
      stub_model(GradeConfig,
        :metricconfig_id => 1,
        :weight => "9.99",
        :percentoftotal => "9.99",
        :goal => "",
        :calcToUse => "",
        :type => "",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of grade_configs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
