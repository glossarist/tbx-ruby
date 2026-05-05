# frozen_string_literal: true

module Tbx
  # Body element `<body>` containing all concept entries.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="body">`
  class Body < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :concept_entry, ::Tbx::ConceptEntry, collection: true

    xml do
      root "body"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "conceptEntry", to: :concept_entry
    end
  end
end
