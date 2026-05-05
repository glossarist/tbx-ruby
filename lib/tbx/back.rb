# frozen_string_literal: true

module Tbx
  # Back matter `<back>` containing reference object sections.
  #
  # Used for managing picklists and external references.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="back">`
  class Back < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :ref_object_sec, ::Tbx::RefObjectSec, collection: true

    xml do
      root "back"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "refObjectSec", to: :ref_object_sec
    end
  end
end
