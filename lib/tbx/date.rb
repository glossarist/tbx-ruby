# frozen_string_literal: true

module Tbx
  class DateElement < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :content, :string

    xml do
      root "date"
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_content to: :content
    end
  end
end
