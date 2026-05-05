# frozen_string_literal: true

module Tbx
  class LangSec < Lutaml::Model::Serializable
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :descrip, ::Tbx::Descrip, collection: true
    attribute :descrip_grp, ::Tbx::DescripGrp, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true
    attribute :term_sec, ::Tbx::TermSec, collection: true

    xml do
      root "langSec"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      w3c_attributes :lang
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "descrip", to: :descrip
      map_element "descripGrp", to: :descrip_grp
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
      map_element "termSec", to: :term_sec
    end
  end
end
