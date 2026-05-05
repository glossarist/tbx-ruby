# frozen_string_literal: true

module Tbx
  # Shared attribute declarations for TBX data-category elements.
  #
  # Injects the common attributes defined by the `IDLangTgtDtyp` attribute
  # class + `type` + text content pattern from TBXcoreStructV03.rng.
  #
  # @example Usage in a data-category element
  #   class Admin < Lutaml::Model::Serializable
  #     include Tbx::DataElement
  #     include Tbx::DataElement::InlineContent
  #
  #     xml do
  #       root "admin"
  #       ...
  #     end
  #   end
  module DataElement
    def self.included(base)
      base.class_eval do
        attribute :id, :string
        attribute :lang, Lutaml::Xml::W3c::XmlLangType
        attribute :target, :string
        attribute :datatype, :string
        attribute :type, :string
        attribute :content, :string, collection: true
      end
    end

    # Inline child element attributes for data-category elements that
    # support mixed content per the `entity.noteText` pattern in
    # TBXcoreStructV03.rng.
    #
    # Included by: Admin, Descrip, TermNote (elements with noteText content).
    # NOT included by: AdminNote, DescripNote, TransacNote, Transac, Ref
    # (plain text only per RNG).
    module InlineContent
      def self.included(base)
        base.class_eval do
          attribute :hi, ::Tbx::Hi, collection: true
          attribute :ec, ::Tbx::Ec, collection: true
          attribute :foreign, ::Tbx::Foreign, collection: true
          attribute :ph, ::Tbx::Ph, collection: true
          attribute :sc, ::Tbx::Sc, collection: true
        end
      end
    end
  end
end
