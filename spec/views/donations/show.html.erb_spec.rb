require 'rails_helper'

RSpec.describe "donations/show", type: :view do

  let(:donation) {
    build_stubbed(:donation)
  }

  before(:each) do
    @donation = donation 
  end

  it "renders attributes in <p>" do
    render
  end
end
