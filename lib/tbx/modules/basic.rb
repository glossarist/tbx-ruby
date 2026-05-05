# frozen_string_literal: true

module Tbx
  module Modules
    # Data category definitions for the TBX-Basic module.
    #
    # TBX-Basic extends Min with additional data categories for standard
    # terminology exchange including definitions, context, term types,
    # and transaction tracking.
    #
    # Source: Basic.tbxmd, Basic.rng, Basic.sch
    module Basic
      ADMIN_TYPES = {
        project_subset: "projectSubset",
        source: "source",
      }.freeze

      DESCRIP_TYPES = {
        context: "context",
        definition: "definition",
      }.freeze

      TERM_NOTE_TYPES = {
        geographical_usage: "geographicalUsage",
        grammatical_gender: "grammaticalGender",
        term_location: "termLocation",
        term_type: "termType",
      }.freeze

      TERM_NOTE_VALUES = {
        grammatical_gender: {
          masculine: "masculine",
          feminine: "feminine",
          neuter: "neuter",
          other: "other",
        }.freeze,
        term_location: {
          check_box: "checkBox",
          combo_box: "comboBox",
          combo_box_element: "comboBoxElement",
          dialog_box: "dialogBox",
          group_box: "groupBox",
          informative_message: "informativeMessage",
          interactive_message: "interactiveMessage",
          menu_item: "menuItem",
          progress_bar: "progressBar",
          push_button: "pushButton",
          radio_button: "radioButton",
          slider: "slider",
          spin_box: "spinBox",
          tab: "tab",
          table_text: "tableText",
          text_box: "textBox",
          tool_tip: "toolTip",
          user_defined_type: "user-definedType",
        }.freeze,
        term_type: {
          full_form: "fullForm",
          acronym: "acronym",
          abbreviation: "abbreviation",
          short_form: "shortForm",
          variant: "variant",
          phrase: "phrase",
        }.freeze,
      }.freeze

      REF_TYPES = {
        cross_reference: "crossReference",
      }.freeze

      XREF_TYPES = {
        external_cross_reference: "externalCrossReference",
        x_graphic: "xGraphic",
      }.freeze

      TRANSAC_TYPES = {
        transaction_type: "transactionType",
      }.freeze

      TRANSAC_VALUES = {
        transaction_type: {
          origination: "origination",
          modification: "modification",
        }.freeze,
      }.freeze

      TRANSAC_NOTE_TYPES = {
        responsibility: "responsibility",
      }.freeze
    end
  end
end
