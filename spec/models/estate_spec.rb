require 'rails_helper'

RSpec.describe Estate, type: :model do
  subject { described_class.new(name: "sweet_home", address: "xsw", area: "1000", bedroom: "3", hall: "1", kitchen: "2", park: "1") }

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      name.country = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      address.state = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an area" do
      area.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an bedroom" do
      bedroom.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an hall" do
      hall.pincode = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an kitchen" do
      kitchen.pincode = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an park" do
      park.pincode = nil
      expect(subject).to_not be_valid
    end
  end
end
