# frozen_string_literal: true

module Tbx
  class Document < Lutaml::Model::Serializable
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :type, :string
    attribute :style, :string
    attribute :tbx_header, ::Tbx::TbxHeader
    attribute :text, ::Tbx::TextElement

    xml do
      root "tbx"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      w3c_attributes :lang
      map_attribute "type", to: :type
      map_attribute "style", to: :style
      map_element "tbxHeader", to: :tbx_header
      map_element "text", to: :text
    end
  end
end
