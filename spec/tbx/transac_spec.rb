# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Transac do
  describe "TYPES" do
    it "defines transactionType from Basic" do
      expect(described_class::TYPES[:transaction_type]).to eq("transactionType")
    end
  end

  describe "VALUES" do
    it "defines origination value" do
      expect(described_class::VALUES[:transaction_type][:origination])
        .to eq("origination")
    end

    it "defines modification value" do
      expect(described_class::VALUES[:transaction_type][:modification])
        .to eq("modification")
    end
  end

  describe "XML round-trip" do
    it "round-trips a transac through XML" do
      transac = described_class.new(
        type: "transactionType",
        content: ["origination"],
      )
      xml = transac.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("transactionType")
      expect(parsed.content.join).to eq("origination")
    end
  end
end
