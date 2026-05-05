# frozen_string_literal: true

require "spec_helper"

TBX_TEST_FILES_PATH = File.expand_path(
  "../fixtures/TBX_test_files", __dir__
)

DCA_REFERENCE_PATH = File.expand_path(
  "../../reference-docs/schemas/TBX-Basic_dialect_v1/DCA", __dir__
)

RSpec.describe "TBX round-trips" do
  # Valid LTAC-Global test files — parse AND round-trip
  valid_test_files = Dir.glob(File.join(TBX_TEST_FILES_PATH, "*_good.tbx"))

  valid_test_files.each do |file|
    basename = File.basename(file)

    describe basename do
      let(:doc) { File.read(file) }

      it "parses without error" do
        expect { Tbx::Document.from_xml(doc) }.not_to raise_error
      end

      it "round-trips without data loss" do
        parsed = Tbx::Document.from_xml(doc)
        generated = parsed.to_xml(
          pretty: true,
          declaration: true,
          encoding: "utf-8",
        )

        # Strip processing instructions — lutaml-model drops them during parse
        original = doc.gsub(/<\?(?!xml)[^?]*\?>/, "")

        expect(generated).to be_xml_equivalent_to(original)
      end
    end
  end

  # Invalid test files — parse only (no round-trip expected)
  invalid_test_files = Dir.glob(File.join(TBX_TEST_FILES_PATH, "*_bad.tbx"))

  invalid_test_files.each do |file|
    basename = File.basename(file)

    describe basename do
      let(:doc) { File.read(file) }

      it "parses without error" do
        expect { Tbx::Document.from_xml(doc) }.not_to raise_error
      end
    end
  end

  # DCA reference examples — parse AND round-trip
  Dir.glob(File.join(DCA_REFERENCE_PATH, "*.tbx")).each do |file|
    basename = File.basename(file)

    describe "#{basename} (DCA reference)" do
      let(:doc) { File.read(file) }

      it "parses without error" do
        expect { Tbx::Document.from_xml(doc) }.not_to raise_error
      end

      it "round-trips without data loss" do
        parsed = Tbx::Document.from_xml(doc)
        generated = parsed.to_xml(
          pretty: true,
          declaration: true,
          encoding: "utf-8",
        )

        original = doc.gsub(/<\?(?!xml)[^?]*\?>/, "")

        expect(generated).to be_xml_equivalent_to(original)
      end
    end
  end
end
