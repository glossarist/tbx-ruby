# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tbx::TransacNote do
  describe "TYPES" do
    it "defines responsibility from Basic" do
      expect(described_class::TYPES[:responsibility]).to eq("responsibility")
    end
  end
end
