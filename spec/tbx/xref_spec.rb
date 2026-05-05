# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Xref do
  describe "TYPES" do
    it "composes types from Min and Basic modules" do
      expected = %w[externalCrossReference xGraphic]
      expect(described_class::TYPES.values.sort).to eq(expected.sort)
    end
  end

  describe "XML round-trip" do
    it "round-trips an xref through XML" do
      xref = described_class.new(
        type: "externalCrossReference",
        target: "https://example.com",
        content: ["Example"],
      )
      xml = xref.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("externalCrossReference")
      expect(parsed.target).to eq("https://example.com")
    end
  end
end
