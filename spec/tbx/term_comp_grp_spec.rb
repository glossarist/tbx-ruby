# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TermCompGrp do
  describe "XML round-trip" do
    it "round-trips a termCompGrp with termComp and note" do
      grp = described_class.new(
        term_comp: Tbx::TermComp.new(content: ["hydro"]),
        note: [Tbx::Note.new(content: ["prefix component"])],
      )
      xml = grp.to_xml
      parsed = described_class.from_xml(xml)
      expect(parsed.term_comp.content.join).to eq("hydro")
      expect(parsed.note.length).to eq(1)
    end
  end
end
