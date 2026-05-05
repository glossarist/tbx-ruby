# frozen_string_literal: true

module Tbx
  class Term < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :content, :string, collection: true
    attribute :hi, ::Tbx::Hi, collection: true

    xml do
      root "term"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_content to: :content
      map_element "hi", to: :hi
    end
  end
end
