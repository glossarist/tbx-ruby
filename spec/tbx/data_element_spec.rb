# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::DataElement do
  describe "classes that include DataElement + InlineContent" do
    [Tbx::Admin, Tbx::Descrip, Tbx::TermNote].each do |klass|
      describe klass do
        it "has id attribute" do
          instance = klass.new
          expect(instance).to respond_to(:id)
        end

        it "has lang attribute" do
          instance = klass.new
          expect(instance).to respond_to(:lang)
        end

        it "has target attribute" do
          instance = klass.new
          expect(instance).to respond_to(:target)
        end

        it "has datatype attribute" do
          instance = klass.new
          expect(instance).to respond_to(:datatype)
        end

        it "has type attribute" do
          instance = klass.new
          expect(instance).to respond_to(:type)
        end

        it "has content attribute" do
          instance = klass.new
          expect(instance).to respond_to(:content)
        end

        it "has inline hi attribute" do
          instance = klass.new
          expect(instance).to respond_to(:hi)
        end

        it "has inline ec attribute" do
          instance = klass.new
          expect(instance).to respond_to(:ec)
        end

        it "has inline foreign attribute" do
          instance = klass.new
          expect(instance).to respond_to(:foreign)
        end

        it "has inline ph attribute" do
          instance = klass.new
          expect(instance).to respond_to(:ph)
        end

        it "has inline sc attribute" do
          instance = klass.new
          expect(instance).to respond_to(:sc)
        end
      end
    end
  end

  describe "classes that include DataElement only (no InlineContent)" do
    [Tbx::AdminNote, Tbx::DescripNote, Tbx::TransacNote, Tbx::Transac,
     Tbx::Ref].each do |klass|
      describe klass do
        it "has id attribute" do
          instance = klass.new
          expect(instance).to respond_to(:id)
        end

        it "has type attribute" do
          instance = klass.new
          expect(instance).to respond_to(:type)
        end

        it "has content attribute" do
          instance = klass.new
          expect(instance).to respond_to(:content)
        end

        it "does NOT have inline hi attribute" do
          instance = klass.new
          expect(instance).not_to respond_to(:hi)
        end
      end
    end
  end
end
