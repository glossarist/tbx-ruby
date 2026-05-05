# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TermComp do
  describe "creation" do
    it "creates a term component with text content" do
      tc = described_class.new(content: ["hydro"])
      expect(tc.content).to eq(["hydro"])
    end
  end

  describe "XML round-trip" do
    it "round-trips a termComp through XML" do
      tc = described_class.new(content: ["carbon"])
      xml = tc.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.content.join).to eq("carbon")
    end
  end
end
