require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { described_class.new(country: "India", state: "MP", city: "sagar", address: "apan-ghar", pincode: "1234", user_id: User.last.id) }

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a country" do
      subject.country = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an state" do
      subject.state = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an city" do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an pincode" do
      subject.pincode = nil
      expect(subject).to_not be_valid
    end
  end
end
