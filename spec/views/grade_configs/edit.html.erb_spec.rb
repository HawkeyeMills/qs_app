require 'spec_helper'

describe "grade_configs/edit" do
  before(:each) do
    @grade_config = assign(:grade_config, stub_model(GradeConfig,
      :metricconfig_id => 1,
      :weight => "9.99",
      :percentoftotal => "9.99",
      :goal => "",
      :calcToUse => "",
      :type => "",
      :note => "MyText"
    ))
  end

  it "renders the edit grade_config form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grade_config_path(@grade_config), "post" do
      assert_select "input#grade_config_metricconfig_id[name=?]", "grade_config[metricconfig_id]"
      assert_select "input#grade_config_weight[name=?]", "grade_config[weight]"
      assert_select "input#grade_config_percentoftotal[name=?]", "grade_config[percentoftotal]"
      assert_select "input#grade_config_goal[name=?]", "grade_config[goal]"
      assert_select "input#grade_config_calcToUse[name=?]", "grade_config[calcToUse]"
      assert_select "input#grade_config_type[name=?]", "grade_config[type]"
      assert_select "textarea#grade_config_note[name=?]", "grade_config[note]"
    end
  end
end
