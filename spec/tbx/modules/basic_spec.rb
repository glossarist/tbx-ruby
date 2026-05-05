# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Modules::Basic do
  describe "ADMIN_TYPES" do
    it "contains projectSubset and source" do
      expect(described_class::ADMIN_TYPES[:project_subset])
        .to eq("projectSubset")
      expect(described_class::ADMIN_TYPES[:source]).to eq("source")
    end
  end

  describe "DESCRIP_TYPES" do
    it "contains context and definition" do
      expect(described_class::DESCRIP_TYPES[:context]).to eq("context")
      expect(described_class::DESCRIP_TYPES[:definition]).to eq("definition")
    end
  end

  describe "TERM_NOTE_TYPES" do
    it "contains geographicalUsage, grammaticalGender, termLocation, termType" \
       do
      expect(described_class::TERM_NOTE_TYPES[:geographical_usage])
        .to eq("geographicalUsage")
      expect(described_class::TERM_NOTE_TYPES[:grammatical_gender])
        .to eq("grammaticalGender")
      expect(described_class::TERM_NOTE_TYPES[:term_location])
        .to eq("termLocation")
      expect(described_class::TERM_NOTE_TYPES[:term_type]).to eq("termType")
    end
  end

  describe "TERM_NOTE_VALUES" do
    it "defines grammaticalGender picklist values" do
      vals = described_class::TERM_NOTE_VALUES[:grammatical_gender]
      expect(vals.values.sort).to eq(%w[masculine feminine neuter other].sort)
    end

    it "defines termLocation picklist with 18 values" do
      vals = described_class::TERM_NOTE_VALUES[:term_location]
      expect(vals.length).to eq(18)
    end

    it "defines termType picklist values" do
      vals = described_class::TERM_NOTE_VALUES[:term_type]
      expect(vals.values.sort).to eq(%w[
        fullForm acronym abbreviation shortForm variant phrase
      ].sort)
    end
  end

  describe "REF_TYPES" do
    it "contains crossReference" do
      expect(described_class::REF_TYPES[:cross_reference])
        .to eq("crossReference")
    end
  end

  describe "XREF_TYPES" do
    it "contains externalCrossReference and xGraphic" do
      expect(described_class::XREF_TYPES[:external_cross_reference])
        .to eq("externalCrossReference")
      expect(described_class::XREF_TYPES[:x_graphic]).to eq("xGraphic")
    end
  end

  describe "TRANSAC_TYPES" do
    it "contains transactionType" do
      expect(described_class::TRANSAC_TYPES[:transaction_type])
        .to eq("transactionType")
    end
  end

  describe "TRANSAC_VALUES" do
    it "defines origination and modification" do
      vals = described_class::TRANSAC_VALUES[:transaction_type]
      expect(vals[:origination]).to eq("origination")
      expect(vals[:modification]).to eq("modification")
    end
  end

  describe "TRANSAC_NOTE_TYPES" do
    it "contains responsibility" do
      expect(described_class::TRANSAC_NOTE_TYPES[:responsibility])
        .to eq("responsibility")
    end
  end
end
