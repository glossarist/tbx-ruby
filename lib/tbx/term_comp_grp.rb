# frozen_string_literal: true

module Tbx
  # Term component group `<termCompGrp>`.
  #
  # Groups a `<termComp>` with associated `<note>` elements.
  #
  # Schema source: TermComp-namespace.rng `<define name="termCompGrp">`
  class TermCompGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :term_comp, ::Tbx::TermComp
    attribute :note, ::Tbx::Note, collection: true

    xml do
      root "termCompGrp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "termComp", to: :term_comp
      map_element "note", to: :note
    end
  end
end
