# frozen_string_literal: true

module Tbx
  class TermSec < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :term, ::Tbx::Term
    attribute :term_note, ::Tbx::TermNote, collection: true
    attribute :term_note_grp, ::Tbx::TermNoteGrp, collection: true
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :descrip, ::Tbx::Descrip, collection: true
    attribute :descrip_grp, ::Tbx::DescripGrp, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "termSec"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "term", to: :term
      map_element "termNote", to: :term_note
      map_element "termNoteGrp", to: :term_note_grp
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "descrip", to: :descrip
      map_element "descripGrp", to: :descrip_grp
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
    end
  end
end
