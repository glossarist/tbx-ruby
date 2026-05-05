# frozen_string_literal: true

module Tbx
  class EncodingDesc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :p, ::Tbx::P, collection: true

    xml do
      root "encodingDesc"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "p", to: :p
    end
  end
end
