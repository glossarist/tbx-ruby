# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Admin do
  describe "TYPES" do
    it "composes types from Min, Basic, and Linguist modules" do
      expected = %w[customerSubset projectSubset source reading]
      expect(described_class::TYPES.values.sort).to eq(expected.sort)
    end

    it "defines customerSubset from Min" do
      expect(described_class::TYPES[:customer_subset]).to eq("customerSubset")
    end

    it "defines projectSubset from Basic" do
      expect(described_class::TYPES[:project_subset]).to eq("projectSubset")
    end

    it "defines source from Basic" do
      expect(described_class::TYPES[:source]).to eq("source")
    end

    it "defines reading from Linguist" do
      expect(described_class::TYPES[:reading]).to eq("reading")
    end
  end

  describe "creation" do
    it "creates an admin with type and content" do
      admin = described_class.new(
        type: "source",
        content: ["ISO 30042:2019"],
      )
      expect(admin.type).to eq("source")
      expect(admin.content).to eq(["ISO 30042:2019"])
    end
  end

  describe "XML round-trip" do
    it "round-trips an admin element through XML" do
      admin = described_class.new(
        type: "customerSubset",
        content: ["engineering"],
      )
      xml = admin.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("customerSubset")
      expect(parsed.content.join).to eq("engineering")
    end

    it "round-trips an admin with inline hi element" do
      admin = described_class.new(
        type: "source",
        content: ["Text from "],
        hi: [Tbx::Hi.new(content: ["author"])],
      )
      xml = admin.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("source")
      expect(parsed.hi.length).to eq(1)
    end
  end
end
