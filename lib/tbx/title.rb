# frozen_string_literal: true

module Tbx
  # Title element `<title>`.
  #
  # Used within `<titleStmt>` to specify the title of the TBX file.
  # Content is plain text only.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="title">`
  class Title < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :content, :string, collection: true

    xml do
      root "title"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_content to: :content
    end
  end
end
