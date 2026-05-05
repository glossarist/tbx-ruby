# frozen_string_literal: true

module Tbx
  class Hi < Lutaml::Model::Serializable
    attribute :target, :string
    attribute :type, :string
    attribute :content, :string, collection: true

    xml do
      root "hi"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "target", to: :target
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
