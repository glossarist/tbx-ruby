# frozen_string_literal: true

module Tbx
  class TermNoteGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :term_note, ::Tbx::TermNote
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "termNoteGrp"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "termNote", to: :term_note
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
    end
  end
end
