# frozen_string_literal: true

module Tbx
  # XLIFF inline end-code marker `<ec>`.
  #
  # Used for representing inline formatting codes from source formats.
  # Paired with `<sc>` via the `startRef` attribute.
  #
  # Attributes:
  # * `startRef` (IDREF) — references the id of the corresponding `<sc>`
  # * `isolated` (yes/no) — whether this code is isolated
  # * `disp` — display text
  # * `equiv` — equivalent text
  # * `id` — unique identifier
  # * `type` (fmt, ui, quote, link, image, other) — code type
  # * `subtype` — sub-classification
  # * `target` — target reference
  #
  # Schema source: TBXcoreStructV03.rng `<define name="ec">`
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
      namespace ::Tbx::Namespace

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
