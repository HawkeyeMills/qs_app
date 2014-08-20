require 'spec_helper'

describe "grade_configs/show" do
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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
