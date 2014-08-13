require 'spec_helper'

describe Metric do
  let(:user) { FactoryGirl.create(:user) }
  before { @metric = user.metrics.build(value: "Steps") }

  subject { @metric }

  it { should respond_to(:value) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

    it { should be_valid }

  describe "when user_id is not present" do
    before { @metric.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank value" do
    before { @metric.value = " " }
    it { should_not be_valid }
  end

  describe "with value that is too long" do
    before { @metric.value = "a" * 26 }
    it { should_not be_valid }
  end
end