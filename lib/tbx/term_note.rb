# frozen_string_literal: true

module Tbx
  # Term-level data category element `<termNote>`.
  #
  # Carries grammatical, administrative, and usage information about a term.
  # Only allowed as a child of `<termSec>` or `<termNoteGrp>`.
  #
  # Permitted `type` values (composed from all modules):
  #
  # * Min module: `administrativeStatus` (picklist: admittedTerm-admn-sts,
  #   deprecatedTerm-admn-sts, supersededTerm-admn-sts, preferredTerm-admn-sts),
  #   `partOfSpeech` (picklist: adjective, noun, other, verb, adverb)
  # * Basic module: `geographicalUsage` (string), `grammaticalGender`
  #   (picklist: masculine, feminine, neuter, other), `termLocation`
  #   (picklist: 18 UI element types), `termType` (picklist: fullForm,
  #   acronym, abbreviation, shortForm, variant, phrase)
  # * Linguist module: `grammaticalNumber` (picklist: singular, plural, dual,
  #   mass, otherNumber), `register` (picklist: colloquialRegister,
  #   neutralRegister, technicalRegister, in-houseRegister,
  #   bench-levelRegister, slangRegister, vulgarRegister),
  #   `transferComment` (string)
  #
  # Content model: `entity.noteText` (mixed text + inline elements hi, ec,
  # foreign, ph, sc).
  #
  # @see TYPES
  #
  # Schema source: TBXcoreStructV03.rng `<define name="termNote">`;
  # data categories: Min.tbxmd, Basic.tbxmd, Linguist.tbxmd;
  # permitted types validated by DCA Schematron (e.g. TBX-Basic_DCA.sch).
  class TermNote < Lutaml::Model::Serializable
    include Tbx::DataElement
    include Tbx::DataElement::InlineContent

    # Permitted termNote/@type values per TBX-Basic DCA Schematron
    # (ISO 30042:2019, TBX-Basic dialect, DCA style).
    #
    # Source: reference-docs/schemas/TBX-Basic_DCA.sch line 54-56
    #   "Permitted type value(s): administrativeStatus, partOfSpeech,
    #    geographicalUsage, grammaticalGender, termLocation, termType"
    TYPES = Modules::Min::TERM_NOTE_TYPES
      .merge(Modules::Basic::TERM_NOTE_TYPES)
      .merge(Modules::Linguist::TERM_NOTE_TYPES).freeze

    VALUES = Modules::Min::TERM_NOTE_VALUES
      .merge(Modules::Basic::TERM_NOTE_VALUES)
      .merge(Modules::Linguist::TERM_NOTE_VALUES).freeze

    xml do
      root "termNote"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "target", to: :target
      map_attribute "datatype", to: :datatype
      map_attribute "type", to: :type
      map_content to: :content
      map_element "hi", to: :hi
      map_element "ec", to: :ec
      map_element "foreign", to: :foreign
      map_element "ph", to: :ph
      map_element "sc", to: :sc
    end
  end
end
