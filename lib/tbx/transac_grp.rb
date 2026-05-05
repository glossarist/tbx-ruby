# frozen_string_literal: true

module Tbx
  # Groups a `<transac>` transaction element with its date and
  # responsibility information.
  #
  # Children: `transac` (required), then date, note, ref, transacNote, xref.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="transacGrp">`
  class TransacGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :transac, ::Tbx::Transac
    attribute :date, ::Tbx::DateElement, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_note, ::Tbx::TransacNote, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "transacGrp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "transac", to: :transac
      map_element "date", to: :date
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacNote", to: :transac_note
      map_element "xref", to: :xref
    end
  end
end
