# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Hi do
  describe "TYPES" do
    it "defines all 7 core RNG hi types" do
      expected = %w[entailedTerm hotkey italics bold superscript subscript math]
      expect(described_class::TYPES.values.sort).to eq(expected.sort)
    end

    it "defines entailedTerm type" do
      expect(described_class::TYPES[:entailed_term]).to eq("entailedTerm")
    end

    it "defines hotkey type" do
      expect(described_class::TYPES[:hotkey]).to eq("hotkey")
    end

    it "defines italics type" do
      expect(described_class::TYPES[:italics]).to eq("italics")
    end

    it "defines bold type" do
      expect(described_class::TYPES[:bold]).to eq("bold")
    end

    it "defines superscript type" do
      expect(described_class::TYPES[:superscript]).to eq("superscript")
    end

    it "defines subscript type" do
      expect(described_class::TYPES[:subscript]).to eq("subscript")
    end

    it "defines math type" do
      expect(described_class::TYPES[:math]).to eq("math")
    end
  end

  describe "creation" do
    it "creates an entailedTerm hi with target" do
      hi = described_class.new(
        type: "entailedTerm",
        target: "c1",
        content: ["related term"],
      )
      expect(hi.type).to eq("entailedTerm")
      expect(hi.target).to eq("c1")
      expect(hi.content).to eq(["related term"])
    end
  end

  describe "XML round-trip" do
    it "round-trips a hi element through XML" do
      hi = described_class.new(
        type: "italics",
        content: ["emphasized text"],
      )
      xml = hi.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("italics")
      expect(parsed.content.join).to eq("emphasized text")
    end
  end
end
