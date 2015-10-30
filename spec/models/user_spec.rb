require 'rails_helper'

describe User do
  it "works" do
    expect(create(:user)).to be_persisted
  end
end
