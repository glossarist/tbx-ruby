# frozen_string_literal: true

module Tbx
  # Wrapper element `<text>` for the termbase body and back matter.
  #
  # Children: `body` (optional), `back` (optional).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="text">`
  class TextElement < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :body, ::Tbx::Body
    attribute :back, ::Tbx::Back

    xml do
      root "text"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "body", to: :body
      map_element "back", to: :back
    end
  end
end
