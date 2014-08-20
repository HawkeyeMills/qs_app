require 'spec_helper'

describe "metric_configs/new" do
  before(:each) do
    assign(:metric_config, stub_model(MetricConfig,
      :user_id => 1,
      :value => "MyString",
      :orderby => 1,
      :profiledisplay => false,
      :updateable => false
    ).as_new_record)
  end

  it "renders new metric_config form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metric_configs_path, "post" do
      assert_select "input#metric_config_user_id[name=?]", "metric_config[user_id]"
      assert_select "input#metric_config_value[name=?]", "metric_config[value]"
      assert_select "input#metric_config_orderby[name=?]", "metric_config[orderby]"
      assert_select "input#metric_config_profiledisplay[name=?]", "metric_config[profiledisplay]"
      assert_select "input#metric_config_updateable[name=?]", "metric_config[updateable]"
    end
  end
end
