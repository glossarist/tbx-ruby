# frozen_string_literal: true

module Tbx
  class TextElement < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :body, ::Tbx::Body
    attribute :back, ::Tbx::Back

    xml do
      root "text"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "body", to: :body
      map_element "back", to: :back
    end
  end
end
