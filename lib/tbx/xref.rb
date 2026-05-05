# frozen_string_literal: true

module Tbx
  # External cross-reference element `<xref>`.
  #
  # The `target` attribute holds a URI (http/https) pointing to an external
  # resource. Unlike `Ref`, which uses IDREF for internal references, Xref
  # uses anyURI for external resources.
  #
  # Permitted `type` values:
  #
  # * Min module: `externalCrossReference` — reference to an external resource
  # * Basic module: `externalCrossReference` — external reference (DC-226),
  #   `xGraphic` — graphic image associated with the concept (DC-2920)
  #
  # Schema source: TBXcoreStructV03.rng `<define name="xref">`;
  # data categories: Basic.tbxmd.
  class Xref < Lutaml::Model::Serializable
    TYPES = Modules::Min::XREF_TYPES
      .merge(Modules::Basic::XREF_TYPES).freeze
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
