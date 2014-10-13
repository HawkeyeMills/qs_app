require 'spec_helper'

describe "grades/index" do
  before(:each) do
    assign(:grades, [
      stub_model(Grade,
        :gradevalue => "Gradevalue",
        :minrange => 1,
        :maxrange => 2
      ),
      stub_model(Grade,
        :gradevalue => "Gradevalue",
        :minrange => 1,
        :maxrange => 2
      )
    ])
  end

  it "renders a list of grades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gradevalue".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
