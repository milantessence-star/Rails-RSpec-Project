require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserHelper, type: :helper do
  describe "#full_name" do
    context "first name is valid and second name is nil or empty" do
      it "first name" do
        expect(helper.full_name("Milan", "")).to eq("Milan")
      end
    end
    context "first name is nil or empty and second name is valid" do
      it "second name" do
        expect(helper.full_name(nil, "Thesiya")).to eq("Thesiya")
      end
    end
    context "first and second name is valid" do
      it "first and last name" do
        expect(helper.full_name("Milan", "Thesiya")).to eq("Milan Thesiya")
      end
    end
  end
end
