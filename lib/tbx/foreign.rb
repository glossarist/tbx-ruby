# frozen_string_literal: true

module Tbx
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
