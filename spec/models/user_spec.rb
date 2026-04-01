require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: "abc@gmail.com", age: 23) }
  describe "Data validation" do
    context "User without name" do
      it "is invalid" do
        user.name = nil
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("Can't be blank")
      end
    end
    context "User with name" do
      it "is valid" do
        user.name = "Milan"
        expect(user).to be_valid
      end
    end
  end
  describe "Callback validation" do
    it "before save name must be in uppercase" do
      user = User.create!(name: "MILAN", email: "abc@gmail.com", age: 23)
      expect(user.name).to eq("MILAN")
    end
  end
  describe "Association validation" do
    it "Find association" do
      association = User.reflect_on_association(:posts)
      expect(association.macro).to be(:has_many)
    end
  end
end
