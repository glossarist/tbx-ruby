# frozen_string_literal: true

module Tbx
  class Ph < Lutaml::Model::Serializable
    attribute :type, :string

    xml do
      root "ph"
      namespace ::Tbx::Namespace

      map_attribute "type", to: :type
    end
  end
end
