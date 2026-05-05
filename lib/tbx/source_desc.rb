# frozen_string_literal: true

module Tbx
  # Source description `<sourceDesc>`.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="sourceDesc">`
  class SourceDesc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :p, ::Tbx::P, collection: true

    xml do
      root "sourceDesc"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_element "p", to: :p
    end
  end
end
