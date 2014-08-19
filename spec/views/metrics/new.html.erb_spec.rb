require 'spec_helper'

describe "metrics/new" do
  before(:each) do
    assign(:metric, stub_model(Metric).as_new_record)
  end

  it "renders new metric form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metrics_path, "post" do
    end
  end
end
