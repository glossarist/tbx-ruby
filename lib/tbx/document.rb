# frozen_string_literal: true

module Tbx
  # Root element of a TBX (Termbase Exchange) document per ISO 30042:2019.
  #
  # The `type` attribute declares the dialect (e.g. "TBX-Basic", "TBX-Min",
  # "TBX-Core", "TBX-Linguist"), and `style` declares the serialization
  # style ("dca" for Data Category Archive or "dct" for Data Category Tagging).
  #
  # @example Parsing a TBX file
  #   doc = Tbx::Document.from_xml(File.read("glossary.tbx"))
  #   doc.type   # => "TBX-Basic"
  #   doc.style  # => "dca"
  #
  # Schema source: TBXcoreStructV03.rng `<define name="tbx">`
  class Document < Lutaml::Model::Serializable
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :type, :string
    attribute :style, :string
    attribute :tbx_header, ::Tbx::TbxHeader
    attribute :text, ::Tbx::TextElement

    xml do
      root "tbx"
      mixed_content
      namespace ::Tbx::Namespace

      w3c_attributes :lang
      map_attribute "type", to: :type
      map_attribute "style", to: :style
      map_element "tbxHeader", to: :tbx_header
      map_element "text", to: :text
    end
  end
end
