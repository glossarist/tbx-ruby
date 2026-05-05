# frozen_string_literal: true

module Tbx
  # XLIFF inline placeholder `<ph>`.
  #
  # Represents a code that does not have a distinct start and end.
  # Empty element with optional `type` attribute.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="ph">`
  class Ph < Lutaml::Model::Serializable
    attribute :type, :string

    xml do
      root "ph"
      namespace ::Tbx::Namespace

      map_attribute "type", to: :type
    end
  end
end
