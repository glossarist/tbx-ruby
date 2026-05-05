# frozen_string_literal: true

module Tbx
  # Foreign-language text element `<foreign>`.
  #
  # Marks text in a foreign language. The `xml:lang` attribute indicates
  # the language. Content model: `entity.noteText` (mixed text + inline
  # elements).
  # Schema source: TBXcoreStructV03.rng `<define name="foreign">`
  class Foreign < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :content, :string, collection: true
    attribute :hi, ::Tbx::Hi, collection: true
    attribute :ec, ::Tbx::Ec, collection: true
    attribute :foreign, ::Tbx::Foreign, collection: true
    attribute :ph, ::Tbx::Ph, collection: true
    attribute :sc, ::Tbx::Sc, collection: true

    xml do
      root "foreign"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_content to: :content
      map_element "hi", to: :hi
      map_element "ec", to: :ec
      map_element "foreign", to: :foreign
      map_element "ph", to: :ph
      map_element "sc", to: :sc
    end
  end
end
