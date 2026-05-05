# frozen_string_literal: true

module Tbx
  class Sc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :isolated, :string
    attribute :type, :string
    attribute :subtype, :string
    attribute :target, :string

    xml do
      root "sc"
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "isolated", to: :isolated
      map_attribute "type", to: :type
      map_attribute "subtype", to: :subtype
      map_attribute "target", to: :target
    end
  end
end
