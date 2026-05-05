# frozen_string_literal: true

module Tbx
  class RevisionDesc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :change, ::Tbx::Change, collection: true

    xml do
      root "revisionDesc"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_element "change", to: :change
    end
  end
end
