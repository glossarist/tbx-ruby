# frozen_string_literal: true

module Tbx
  # Groups a `<descrip>` element with its administrative data, notes, and
  # source references.
  #
  # Commonly used to associate a `source` admin with a `definition` descrip,
  # providing provenance for descriptive data.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="descripGrp">`
  class DescripGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :descrip, ::Tbx::Descrip
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :descrip_note, ::Tbx::DescripNote, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "descripGrp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "descrip", to: :descrip
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "descripNote", to: :descrip_note
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
    end
  end
end
