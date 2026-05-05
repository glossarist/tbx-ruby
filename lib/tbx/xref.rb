# frozen_string_literal: true

module Tbx
  class Xref < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :target, :string
    attribute :type, :string
    attribute :content, :string, collection: true

    xml do
      root "xref"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "target", to: :target
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
