# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TermNote do
  describe "TYPES constants" do
    it "defines administrativeStatus type" do
      expect(described_class::TYPES[:administrative_status])
        .to eq("administrativeStatus")
    end

    it "defines partOfSpeech type" do
      expect(described_class::TYPES[:part_of_speech])
        .to eq("partOfSpeech")
    end

    it "defines geographicalUsage type" do
      expect(described_class::TYPES[:geographical_usage])
        .to eq("geographicalUsage")
    end

    it "defines grammaticalGender type" do
      expect(described_class::TYPES[:grammatical_gender])
        .to eq("grammaticalGender")
    end

    it "defines termLocation type" do
      expect(described_class::TYPES[:term_location])
        .to eq("termLocation")
    end

    it "defines termType type" do
      expect(described_class::TYPES[:term_type])
        .to eq("termType")
    end
  end

  describe "TYPES completeness" do
    it "composes all termNote types from Min, Basic, and Linguist" do
      permitted = %w[
        administrativeStatus partOfSpeech
        geographicalUsage grammaticalGender termLocation termType
        grammaticalNumber register transferComment
      ]
      expect(described_class::TYPES.values.sort)
        .to eq(permitted.sort)
    end
  end

  describe "standard termNote creation" do
    it "creates an administrativeStatus note" do
      note = described_class.new(
        type: described_class::TYPES[:administrative_status],
        content: ["preferredTerm-admn-sts"],
      )
      expect(note.type).to eq("administrativeStatus")
      expect(note.content).to eq(["preferredTerm-admn-sts"])
    end

    it "creates a partOfSpeech note" do
      note = described_class.new(
        type: described_class::TYPES[:part_of_speech],
        content: ["noun"],
      )
      expect(note.type).to eq("partOfSpeech")
      expect(note.content).to eq(["noun"])
    end

    it "creates a termType note" do
      note = described_class.new(
        type: described_class::TYPES[:term_type],
        content: ["fullForm"],
      )
      expect(note.type).to eq("termType")
    end

    it "creates a grammaticalGender note" do
      note = described_class.new(
        type: described_class::TYPES[:grammatical_gender],
        content: ["masculine"],
      )
      expect(note.type).to eq("grammaticalGender")
    end
  end

  describe "XML round-trip" do
    it "round-trips a termNote through XML" do
      original = described_class.new(
        type: "partOfSpeech",
        content: ["verb"],
      )
      xml = original.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("partOfSpeech")
      expect(parsed.content.join).to eq("verb")
    end
  end
end
