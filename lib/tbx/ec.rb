# frozen_string_literal: true

module Tbx
  class Ec < Lutaml::Model::Serializable
    attribute :start_ref, :string
    attribute :isolated, :string
    attribute :disp, :string
    attribute :equiv, :string
    attribute :id, :string
    attribute :type, :string
    attribute :subtype, :string
    attribute :target, :string

    xml do
      root "ec"
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "startRef", to: :start_ref
      map_attribute "isolated", to: :isolated
      map_attribute "disp", to: :disp
      map_attribute "equiv", to: :equiv
      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_attribute "subtype", to: :subtype
      map_attribute "target", to: :target
    end
  end
end
