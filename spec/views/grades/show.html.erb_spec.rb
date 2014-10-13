require 'spec_helper'

describe "grades/show" do
  before(:each) do
    @grade = assign(:grade, stub_model(Grade,
      :gradevalue => "Gradevalue",
      :minrange => 1,
      :maxrange => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gradevalue/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
