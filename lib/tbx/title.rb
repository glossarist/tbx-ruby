# frozen_string_literal: true

module Tbx
  class Title < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :content, :string, collection: true

    xml do
      root "title"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_content to: :content
    end
  end
end
