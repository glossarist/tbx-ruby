# frozen_string_literal: true

module Tbx
  # Internal reference element `<ref>`.
  #
  # Used for cross-references within the same termbase. The `target`
  # attribute holds an IDREF pointing to another element's `id`.
  #
  # Permitted `type` values:
  #
  # * Basic module: `crossReference` — reference to another concept entry
  #   in the same termbase (DC-164), level: conceptEntry/termSec
  #
  # Content is plain text only (no inline elements per the core RNG).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="ref">`;
  # data category: Basic.tbxmd.
  class Ref < Lutaml::Model::Serializable
    include Tbx::DataElement

    TYPES = Modules::Basic::REF_TYPES.freeze

    xml do
      root "ref"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "target", to: :target
      map_attribute "datatype", to: :datatype
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
