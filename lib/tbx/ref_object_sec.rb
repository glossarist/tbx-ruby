# frozen_string_literal: true

module Tbx
  # Reference object section `<refObjectSec>` in back matter.
  #
  # Contains reference objects that define picklists and value sets used
  # by data category elements throughout the termbase.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="refObjectSec">`
  class RefObjectSec < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :type, :string
    attribute :ref_object, ::Tbx::RefObject, collection: true

    xml do
      root "refObjectSec"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_element "refObject", to: :ref_object
    end
  end
end
