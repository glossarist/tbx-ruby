# frozen_string_literal: true

module Tbx
  class AdminNote < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :target, :string
    attribute :datatype, :string
    attribute :type, :string
    attribute :content, :string, collection: true

    xml do
      root "adminNote"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "target", to: :target
      map_attribute "datatype", to: :datatype
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
