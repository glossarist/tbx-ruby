# frozen_string_literal: true

module Tbx
  # Inline highlighting element `<hi>`.
  #
  # Used within term, note, and other text content to mark up special text
  # ranges. The `entailedTerm` type with `target` attribute creates inline
  # cross-references to other concepts.
  #
  # Permitted `type` values (from Core RNG):
  #
  # * `entailedTerm` — cross-reference to another concept within term text
  # * `hotkey` — keyboard shortcut designation
  # * `italics` — italic text emphasis
  # * `bold` — bold text emphasis
  # * `superscript` — superscript text
  # * `subscript` — subscript text
  # * `math` — mathematical notation
  #
  # Schema source: TBXcoreStructV03.rng `<define name="hi">`
  class Hi < Lutaml::Model::Serializable
    TYPES = Modules::CoreTypes::HI_TYPES.freeze
    attribute :target, :string
    attribute :type, :string
    attribute :content, :string, collection: true

    xml do
      root "hi"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "target", to: :target
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
