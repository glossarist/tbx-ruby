# frozen_string_literal: true

module Tbx
  module Modules
    # Data category definitions for the TBX-Min module.
    #
    # TBX-Min provides a minimal set of data categories for simple
    # terminology exchange.
    #
    # Source: Min.tbxmd, Min.rng, Min.sch
    module Min
      ADMIN_TYPES = {
        customer_subset: "customerSubset",
      }.freeze

      DESCRIP_TYPES = {
        subject_field: "subjectField",
      }.freeze

      TERM_NOTE_TYPES = {
        administrative_status: "administrativeStatus",
        part_of_speech: "partOfSpeech",
      }.freeze

      TERM_NOTE_VALUES = {
        administrative_status: {
          admitted_term: "admittedTerm-admn-sts",
          deprecated_term: "deprecatedTerm-admn-sts",
          superseded_term: "supersededTerm-admn-sts",
          preferred_term: "preferredTerm-admn-sts",
        }.freeze,
        part_of_speech: {
          adjective: "adjective",
          noun: "noun",
          other: "other",
          verb: "verb",
          adverb: "adverb",
        }.freeze,
      }.freeze

      XREF_TYPES = {
        external_cross_reference: "externalCrossReference",
      }.freeze
    end
  end
end
