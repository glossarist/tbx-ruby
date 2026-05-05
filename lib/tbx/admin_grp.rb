# frozen_string_literal: true

module Tbx
  # Groups an `<admin>` element with its associated notes and references.
  #
  # Children: `admin` (required), then adminNote, note, ref, xref.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="adminGrp">`
  class AdminGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :admin, ::Tbx::Admin
    attribute :admin_note, ::Tbx::AdminNote, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "adminGrp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "admin", to: :admin
      map_element "adminNote", to: :admin_note
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "xref", to: :xref
    end
  end
end
