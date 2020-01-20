require 'rails_helper'

RSpec.describe Grant, type: :model do
  let(:disbursement) {
    build_stubbed(:disbursement)
  }

  let(:donation) {
    build_stubbed(:donation)
  }

  let(:grant) {
    build_stubbed(:grant, disbursements: [disbursement, disbursement], donations: [donation])
  }

  it "includes the year in the name" do
    expect(grant.name).to match /2020 HUMI/
  end

  it "includes and partner in the name" do
    expect(grant.name).to match /Family Promise/
  end

  it 'sums and formats the move-in amount in USD' do
    expect(grant.total_move_in_amount_formatted).to eq('$400.00')
  end

  it 'sums and formats the prevention amount in USD' do
    expect(grant.total_prevention_amount_formatted).to eq('$0.00')
  end

  it 'counts the total number of children' do
    expect(grant.total_children_helped).to eq(4)
  end

  it 'sums and formats the total number of donations' do
    expect(grant.total_community_donations_formatted).to eq("$2,500.00")
  end
end
