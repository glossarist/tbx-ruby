# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Descrip do
  describe "TYPES" do
    it "composes types from Min and Basic modules" do
      expected = %w[subjectField context definition]
      expect(described_class::TYPES.values.sort).to eq(expected.sort)
    end

    it "defines subjectField from Min" do
      expect(described_class::TYPES[:subject_field]).to eq("subjectField")
    end

    it "defines context from Basic" do
      expect(described_class::TYPES[:context]).to eq("context")
    end

    it "defines definition from Basic" do
      expect(described_class::TYPES[:definition]).to eq("definition")
    end
  end

  describe "creation" do
    it "creates a definition descrip" do
      descrip = described_class.new(
        type: "definition",
        content: ["A term for testing purposes."],
      )
      expect(descrip.type).to eq("definition")
      expect(descrip.content).to eq(["A term for testing purposes."])
    end
  end

  describe "XML round-trip" do
    it "round-trips a descrip through XML" do
      descrip = described_class.new(
        type: "subjectField",
        content: ["astronomy"],
      )
      xml = descrip.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.type).to eq("subjectField")
      expect(parsed.content.join).to eq("astronomy")
    end
  end
end
