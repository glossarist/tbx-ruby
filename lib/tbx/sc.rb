# frozen_string_literal: true

module Tbx
  # XLIFF inline start-code marker `<sc>`.
  #
  # Used for representing inline formatting codes from source formats.
  # The `id` is required and is referenced by a corresponding `<ec>`
  # element's `startRef`.
  #
  # Attributes per core RNG: `id` (required, type ID), `isolated` (optional,
  # yes/no).
  # Schema source: TBXcoreStructV03.rng `<define name="sc">`
  class Sc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :isolated, :string

    xml do
      root "sc"
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "isolated", to: :isolated
    end
  end
end
