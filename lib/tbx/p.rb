# frozen_string_literal: true

module Tbx
  # Paragraph element `<p>`.
  #
  # Used for prose text in header contexts (publicationStmt, sourceDesc,
  # encodingDesc, change).
  #
  # Content model: `entity.noteText` (mixed text + inline elements hi, ec,
  # foreign, ph, sc).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="p">`
  class P < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :type, :string
    attribute :content, :string, collection: true
    attribute :hi, ::Tbx::Hi, collection: true
    attribute :ec, ::Tbx::Ec, collection: true
    attribute :foreign, ::Tbx::Foreign, collection: true
    attribute :ph, ::Tbx::Ph, collection: true
    attribute :sc, ::Tbx::Sc, collection: true

    xml do
      root "p"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "type", to: :type
      map_content to: :content
      map_element "hi", to: :hi
      map_element "ec", to: :ec
      map_element "foreign", to: :foreign
      map_element "ph", to: :ph
      map_element "sc", to: :sc
    end
  end
end
