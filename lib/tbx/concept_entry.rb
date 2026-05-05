# frozen_string_literal: true

module Tbx
  class ConceptEntry < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :descrip, ::Tbx::Descrip, collection: true
    attribute :descrip_grp, ::Tbx::DescripGrp, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true
    attribute :lang_sec, ::Tbx::LangSec, collection: true

    xml do
      root "conceptEntry"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "descrip", to: :descrip
      map_element "descripGrp", to: :descrip_grp
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
      map_element "langSec", to: :lang_sec
    end
  end
end
