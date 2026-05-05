# frozen_string_literal: true

module Tbx
  module Modules
    # Data category definitions for the TBX-Linguist module.
    #
    # TBX-Linguist extends Basic with additional linguistic data categories
    # including grammatical number, register, and transfer comments.
    #
    # Source: Linguist.tbxmd, Linguist.rng, Linguist.sch
    module Linguist
      ADMIN_TYPES = {
        reading: "reading",
      }.freeze

      ADMIN_NOTE_TYPES = {
        reading_note: "readingNote",
      }.freeze

      TERM_NOTE_TYPES = {
        grammatical_number: "grammaticalNumber",
        register: "register",
        transfer_comment: "transferComment",
      }.freeze

      TERM_NOTE_VALUES = {
        grammatical_number: {
          singular: "singular",
          plural: "plural",
          dual: "dual",
          mass: "mass",
          other_number: "otherNumber",
        }.freeze,
        register: {
          colloquial: "colloquialRegister",
          neutral: "neutralRegister",
          technical: "technicalRegister",
          in_house: "in-houseRegister",
          bench_level: "bench-levelRegister",
          slang: "slangRegister",
          vulgar: "vulgarRegister",
        }.freeze,
      }.freeze
    end
  end
end
