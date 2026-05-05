# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TermNote do
  describe "TYPES constants" do
    it "defines usageStatus type" do
      expect(described_class::TYPES[:usage_status]).to eq("usageStatus")
    end

    it "defines termType type" do
      expect(described_class::TYPES[:term_type]).to eq("termType")
    end

    it "defines grammaticalGender type" do
      expect(described_class::TYPES[:grammatical_gender]).to eq("grammaticalGender")
    end

    it "defines grammaticalNumber type" do
      expect(described_class::TYPES[:grammatical_number]).to eq("grammaticalNumber")
    end

    it "defines partOfSpeech type" do
      expect(described_class::TYPES[:part_of_speech]).to eq("partOfSpeech")
    end

    it "defines entailedTerm type" do
      expect(described_class::TYPES[:entailed_term]).to eq("entailedTerm")
    end
  end

  describe ".entailed_term" do
    it "creates a termNote with entailedTerm type and target" do
      note = described_class.entailed_term(target: "c1")
      expect(note.type).to eq("entailedTerm")
      expect(note.target).to eq("c1")
      expect(note.content).to be_nil
    end

    it "creates a termNote with content" do
      note = described_class.entailed_term(target: "c2", content: "related term")
      expect(note.type).to eq("entailedTerm")
      expect(note.target).to eq("c2")
      expect(note.content).to eq(["related term"])
    end

    it "serializes to valid XML" do
      note = described_class.entailed_term(target: "c1", content: "term text")
      xml = note.to_xml
      doc = Nokogiri::XML(xml)
      expect(doc.errors).to be_empty
      el = doc.at_xpath("//tbx:termNote", "tbx" => Tbx::Namespace.uri)
      expect(el["type"]).to eq("entailedTerm")
      expect(el["target"]).to eq("c1")
      expect(el.text).to eq("term text")
    end

    it "serializes without content" do
      note = described_class.entailed_term(target: "c1")
      xml = note.to_xml
      doc = Nokogiri::XML(xml)
      el = doc.at_xpath("//tbx:termNote", "tbx" => Tbx::Namespace.uri)
      expect(el["type"]).to eq("entailedTerm")
      expect(el["target"]).to eq("c1")
    end

    it "round-trips through XML" do
      original = described_class.entailed_term(target: "c3", content: "another term")
      xml = original.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("entailedTerm")
      expect(parsed.target).to eq("c3")
      expect(parsed.content.join).to eq("another term")
    end
  end

  describe "standard termNote creation" do
    it "creates a usageStatus note" do
      note = described_class.new(type: described_class::TYPES[:usage_status], content: ["admittedTerm"])
      expect(note.type).to eq("usageStatus")
      expect(note.content).to eq(["admittedTerm"])
    end

    it "creates a termType note" do
      note = described_class.new(type: described_class::TYPES[:term_type], content: ["fullForm"])
      expect(note.type).to eq("termType")
    end

    it "creates a grammaticalGender note" do
      note = described_class.new(type: described_class::TYPES[:grammatical_gender], content: ["masculine"])
      expect(note.type).to eq("grammaticalGender")
    end
  end
end
