# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::Document do
  describe "parsing DCA TBX files" do
    let(:core_good_path) do
      fixtures_path("TBX_test_files/core_structure_good.tbx")
    end
    let(:min_good_path) { fixtures_path("TBX_test_files/min_good.tbx") }
    let(:basic_good_path) { fixtures_path("TBX_test_files/basic_good.tbx") }

    it "parses core_structure_good.tbx" do
      doc = described_class.from_xml(File.read(core_good_path))
      expect(doc).to be_a(described_class)
      expect(doc.type).to eq("TBX-Core")
      expect(doc.style).to eq("dca")
      expect(doc.lang).to eq("en")
    end

    it "parses min_good.tbx" do
      doc = described_class.from_xml(File.read(min_good_path))
      expect(doc).to be_a(described_class)
      expect(doc.type).to eq("TBX-Min")
      expect(doc.style).to eq("dca")
    end

    it "parses basic_good.tbx" do
      doc = described_class.from_xml(File.read(basic_good_path))
      expect(doc).to be_a(described_class)
      expect(doc.type).to eq("TBX-Basic")
      expect(doc.style).to eq("dca")
    end

    describe "header parsing" do
      let(:doc) { described_class.from_xml(File.read(core_good_path)) }

      it "parses tbxHeader" do
        expect(doc.tbx_header).to be_a(Tbx::TbxHeader)
      end

      it "parses fileDesc" do
        expect(doc.tbx_header.file_desc).to be_a(Tbx::FileDesc)
      end

      it "parses sourceDesc" do
        expect(doc.tbx_header.file_desc.source_desc).to be_a(Tbx::SourceDesc)
        expect(doc.tbx_header.file_desc.source_desc.p.first.content.join).to include("MultiTerm")
      end
    end

    describe "body parsing" do
      let(:doc) { described_class.from_xml(File.read(min_good_path)) }

      it "parses body with concept entries" do
        expect(doc.text.body).to be_a(Tbx::Body)
        expect(doc.text.body.concept_entry.length).to be > 0
      end

      it "parses conceptEntry id" do
        entry = doc.text.body.concept_entry.first
        expect(entry.id).to eq("c1")
      end

      it "parses langSec" do
        entry = doc.text.body.concept_entry.first
        expect(entry.lang_sec.length).to be > 0
        expect(entry.lang_sec.first.lang).to eq("en")
      end

      it "parses termSec" do
        term_sec = doc.text.body.concept_entry.first.lang_sec.first.term_sec.first
        expect(term_sec).to be_a(Tbx::TermSec)
      end

      it "parses term" do
        term = doc.text.body.concept_entry.first.lang_sec.first.term_sec.first.term
        expect(term).to be_a(Tbx::Term)
        expect(term.content.join).to eq("open cluster")
      end
    end

    describe "term notes and descriptions" do
      let(:doc) { described_class.from_xml(File.read(min_good_path)) }

      it "parses termNote" do
        term_sec = doc.text.body.concept_entry.first.lang_sec.first.term_sec.first
        expect(term_sec.term_note.length).to be >= 2
        types = term_sec.term_note.map(&:type)
        expect(types).to include("partOfSpeech")
        expect(types).to include("usageStatus")
      end

      it "parses descrip on conceptEntry" do
        entry = doc.text.body.concept_entry.first
        expect(entry.descrip.length).to be >= 1
        expect(entry.descrip.first.type).to eq("subjectField")
      end
    end

    describe "notes" do
      let(:doc) { described_class.from_xml(File.read(core_good_path)) }

      it "parses note elements" do
        entry = doc.text.body.concept_entry.first
        expect(entry.note.length).to be >= 1
        expect(entry.note.first.content.join).to include("G-Source")
      end
    end
  end

  describe "parsing DCA Astronomy example" do
    let(:dca_path) do
      fixtures_path("TBX-Basic_dialect_v1/DCA/Example_Astronomy_DCA_VALID.tbx")
    end
    let(:doc) do
      path = File.expand_path("../../reference-docs/schemas/TBX-Basic_dialect_v1/DCA/Example_Astronomy_DCA_VALID.tbx",
                              __dir__)
      described_class.from_xml(File.read(path))
    end

    it "parses the DCA astronomy example" do
      expect(doc).to be_a(described_class)
      expect(doc.type).to eq("TBX-Basic")
      expect(doc.style).to eq("dca")
    end

    it "parses publicationStmt" do
      expect(doc.tbx_header.file_desc.publication_stmt).to be_a(Tbx::PublicationStmt)
      expect(doc.tbx_header.file_desc.publication_stmt.p.length).to eq(2)
    end

    it "parses transacGrp" do
      entry = doc.text.body.concept_entry.first
      expect(entry.transac_grp.length).to be >= 1
      transac = entry.transac_grp.first.transac
      expect(transac).to be_a(Tbx::Transac)
      expect(transac.type).to eq("transactionType")
      expect(transac.content.join).to eq("origination")
    end

    it "parses date in transacGrp" do
      entry = doc.text.body.concept_entry.first
      expect(entry.transac_grp.first.date.first.content).to eq("2010-04-17")
    end

    it "parses transacNote" do
      entry = doc.text.body.concept_entry.first
      note = entry.transac_grp.first.transac_note.first
      expect(note).to be_a(Tbx::TransacNote)
      expect(note.type).to eq("responsibility")
      expect(note.content.join).to eq("Tommy")
    end

    it "parses descripGrp" do
      lang_sec = doc.text.body.concept_entry.first.lang_sec.first
      grp = lang_sec.descrip_grp.first
      expect(grp).to be_a(Tbx::DescripGrp)
      expect(grp.descrip.type).to eq("definition")
      expect(grp.descrip.content.join).to include("group of stars")
    end

    it "parses admin within descripGrp" do
      lang_sec = doc.text.body.concept_entry.first.lang_sec.first
      grp = lang_sec.descrip_grp.first
      expect(grp.admin.first.type).to eq("source")
    end

    it "parses xref" do
      entry = doc.text.body.concept_entry.first
      xref = entry.xref.first
      expect(xref).to be_a(Tbx::Xref)
      expect(xref.type).to eq("xGraphic")
      expect(xref.target).to include("wikipedia.org")
    end
  end
end
