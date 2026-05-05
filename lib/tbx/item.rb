# frozen_string_literal: true

module Tbx
  class Item < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :type, :string
    attribute :content, :string, collection: true
    attribute :hi, ::Tbx::Hi, collection: true
    attribute :ec, ::Tbx::Ec, collection: true
    attribute :foreign, ::Tbx::Foreign, collection: true
    attribute :ph, ::Tbx::Ph, collection: true
    attribute :sc, ::Tbx::Sc, collection: true

    xml do
      root "item"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
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
