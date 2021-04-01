require 'rails_helper'

RSpec.describe Estate, type: :model do
  subject { described_class.new(name: "sweet_home", address: "xsw", area: "1000", bedroom: "3", hall: "1", kitchen: "2", park: "1") }

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an area" do
      subject.area = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an bedroom" do
      subject.bedroom = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an hall" do
      subject.hall = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an kitchen" do
      subject.kitchen = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an park" do
      subject.park = nil
      expect(subject).to_not be_valid
    end
  end
end
