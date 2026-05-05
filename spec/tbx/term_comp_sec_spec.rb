# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TermCompSec do
  describe "TYPES" do
    it "defines all 5 TermComp type values" do
      expected = %w[
        hyphenation lemma morphologicalElement syllabification termElement
      ]
      expect(described_class::TYPES.values.sort).to eq(expected.sort)
    end

    it "defines hyphenation type" do
      expect(described_class::TYPES[:hyphenation]).to eq("hyphenation")
    end

    it "defines lemma type" do
      expect(described_class::TYPES[:lemma]).to eq("lemma")
    end

    it "defines morphologicalElement type" do
      expect(described_class::TYPES[:morphological_element])
        .to eq("morphologicalElement")
    end

    it "defines syllabification type" do
      expect(described_class::TYPES[:syllabification]).to eq("syllabification")
    end

    it "defines termElement type" do
      expect(described_class::TYPES[:term_element]).to eq("termElement")
    end
  end

  describe "XML round-trip" do
    it "round-trips a termCompSec with type and termComp children" do
      sec = described_class.new(
        type: "hyphenation",
        term_comp: [
          Tbx::TermComp.new(content: ["hydro"]),
          Tbx::TermComp.new(content: ["carbon"]),
        ],
      )
      xml = sec.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("hyphenation")
      expect(parsed.term_comp.length).to eq(2)
      expect(parsed.term_comp[0].content.join).to eq("hydro")
      expect(parsed.term_comp[1].content.join).to eq("carbon")
    end

    it "round-trips a termCompSec with termCompGrp children" do
      sec = described_class.new(
        type: "syllabification",
        term_comp_grp: [
          Tbx::TermCompGrp.new(term_comp: Tbx::TermComp.new(content: ["hy"])),
          Tbx::TermCompGrp.new(term_comp: Tbx::TermComp.new(content: ["dro"])),
        ],
      )
      xml = sec.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("syllabification")
      expect(parsed.term_comp_grp.length).to eq(2)
    end
  end
end
