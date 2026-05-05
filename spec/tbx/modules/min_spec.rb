# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Modules::Min do
  describe "ADMIN_TYPES" do
    it "contains customerSubset" do
      expect(described_class::ADMIN_TYPES[:customer_subset])
        .to eq("customerSubset")
    end
  end

  describe "DESCRIP_TYPES" do
    it "contains subjectField" do
      expect(described_class::DESCRIP_TYPES[:subject_field])
        .to eq("subjectField")
    end
  end

  describe "TERM_NOTE_TYPES" do
    it "contains administrativeStatus and partOfSpeech" do
      expect(described_class::TERM_NOTE_TYPES[:administrative_status])
        .to eq("administrativeStatus")
      expect(described_class::TERM_NOTE_TYPES[:part_of_speech])
        .to eq("partOfSpeech")
    end
  end

  describe "TERM_NOTE_VALUES" do
    it "defines administrativeStatus picklist values" do
      vals = described_class::TERM_NOTE_VALUES[:administrative_status]
      expect(vals.values.sort).to eq(%w[
        admittedTerm-admn-sts deprecatedTerm-admn-sts
        preferredTerm-admn-sts supersededTerm-admn-sts
      ].sort)
    end

    it "defines partOfSpeech picklist values" do
      vals = described_class::TERM_NOTE_VALUES[:part_of_speech]
      expect(vals.values.sort).to eq(%w[
        adjective adverb noun other verb
      ].sort)
    end
  end

  describe "XREF_TYPES" do
    it "contains externalCrossReference" do
      expect(described_class::XREF_TYPES[:external_cross_reference])
        .to eq("externalCrossReference")
    end
  end
end
