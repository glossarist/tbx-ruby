# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Ref do
  describe "TYPES" do
    it "defines crossReference from Basic" do
      expect(described_class::TYPES[:cross_reference]).to eq("crossReference")
    end
  end

  describe "XML round-trip" do
    it "round-trips a ref through XML" do
      ref = described_class.new(
        type: "crossReference",
        target: "c2",
        content: ["see also"],
      )
      xml = ref.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("crossReference")
      expect(parsed.target).to eq("c2")
    end
  end
end
