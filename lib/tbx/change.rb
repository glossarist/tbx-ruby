# frozen_string_literal: true

module Tbx
  # A single change record in the revision history `<change>`.
  #
  # Each change record contains one or more paragraph elements describing
  # what changed and when.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="change">`
  class Change < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :p, ::Tbx::P, collection: true

    xml do
      root "change"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_element "p", to: :p
    end
  end
end
