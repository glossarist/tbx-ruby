# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Modules::Linguist do
  describe "ADMIN_TYPES" do
    it "contains reading" do
      expect(described_class::ADMIN_TYPES[:reading]).to eq("reading")
    end
  end

  describe "ADMIN_NOTE_TYPES" do
    it "contains readingNote" do
      expect(described_class::ADMIN_NOTE_TYPES[:reading_note])
        .to eq("readingNote")
    end
  end

  describe "TERM_NOTE_TYPES" do
    it "contains grammaticalNumber, register, transferComment" do
      expect(described_class::TERM_NOTE_TYPES[:grammatical_number])
        .to eq("grammaticalNumber")
      expect(described_class::TERM_NOTE_TYPES[:register]).to eq("register")
      expect(described_class::TERM_NOTE_TYPES[:transfer_comment])
        .to eq("transferComment")
    end
  end

  describe "TERM_NOTE_VALUES" do
    it "defines grammaticalNumber picklist values" do
      vals = described_class::TERM_NOTE_VALUES[:grammatical_number]
      expect(vals.values.sort).to eq(%w[
        singular plural dual mass otherNumber
      ].sort)
    end

    it "defines register picklist with 7 values" do
      vals = described_class::TERM_NOTE_VALUES[:register]
      expect(vals.length).to eq(7)
      expect(vals[:colloquial]).to eq("colloquialRegister")
      expect(vals[:neutral]).to eq("neutralRegister")
      expect(vals[:technical]).to eq("technicalRegister")
    end
  end
end
