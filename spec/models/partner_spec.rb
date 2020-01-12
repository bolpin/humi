require 'rails_helper'

RSpec.describe Partner, type: :model do

  it "is valid with valid attributes" do
    partner = Partner.new(default_attributes)
    expect(partner).to be_valid
  end

  it "is not valid without a name" do
    partner = Partner.new({name: nil})
    expect(partner).to_not be_valid
  end

end

def default_attributes(options={})
  {
    name: "Kiwanis",
    address: "Main Street",
    partner_number: "1",
  }.merge(options)
end
