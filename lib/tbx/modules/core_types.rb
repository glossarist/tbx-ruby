# frozen_string_literal: true

module Tbx
  module Modules
    # Data category definitions from the TBX core RNG schema.
    #
    # These types are not module-specific; they are defined directly in
    # TBXcoreStructV03.rng and apply to all dialects.
    module CoreTypes
      # Permitted `<hi>` element type values per TBXcoreStructV03.rng
      # `<define name="hi">`.
      HI_TYPES = {
        entailed_term: "entailedTerm",
        hotkey: "hotkey",
        italics: "italics",
        bold: "bold",
        superscript: "superscript",
        subscript: "subscript",
        math: "math",
      }.freeze
    end
  end
end
