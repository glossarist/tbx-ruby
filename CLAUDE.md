# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build, Test, and Development Commands

```bash
# Install dependencies
bundle install

# Run tests
bundle exec rspec

# Run a single test file
bundle exec rspec spec/tbx/document_spec.rb

# Run linting
bundle exec rubocop

# Run both (default task)
bundle exec rake
```

## Architecture

This is a Ruby gem for parsing and serializing TBX (Termbase Exchange) documents per ISO 30042:2019. It uses `lutaml-model` for XML serialization/deserialization.

### Namespace Structure

```
Tbx
├── Document         # Root element (<tbx>)
├── TbxHeader        # <tbxHeader>
├── FileDesc         # <fileDesc>
├── PublicationStmt  # <publicationStmt>
├── TitleStmt        # <titleStmt>
├── SourceDesc       # <sourceDesc>
├── EncodingDesc     # <encodingDesc>
├── RevisionDesc     # <revisionDesc>
├── Change           # <change>
├── TextElement      # <text>
├── Body             # <body>
├── Back             # <back>
├── ConceptEntry     # <conceptEntry>
├── LangSec          # <langSec>
├── TermSec          # <termSec>
├── Term             # <term>
├── TermNote         # <termNote>
├── TermNoteGrp      # <termNoteGrp>
├── Descrip          # <descrip>
├── DescripGrp       # <descripGrp>
├── DescripNote      # <descripNote>
├── Admin            # <admin>
├── AdminGrp         # <adminGrp>
├── AdminNote        # <adminNote>
├── Note             # <note>
├── P                # <p>
├── Ref              # <ref>
├── Xref             # <xref>
├── Transac          # <transac>
├── TransacGrp       # <transacGrp>
├── TransacNote      # <transacNote>
├── DateElement      # <date>
├── RefObjectSec     # <refObjectSec>
├── RefObject        # <refObject>
├── ItemSet          # <itemSet>
├── ItemGrp          # <itemGrp>
├── Item             # <item>
├── Hi               # <hi>
├── Foreign          # <foreign>
├── Ec               # <ec>
├── Sc               # <sc>
├── Ph               # <ph>
├── Title            # <title>
├── Namespaces       # XML namespace definitions
└── Ruby             # Gem namespace (Tbx::Ruby::VERSION)
```

### Key Implementation Patterns

**Element Classes** (in `lib/tbx/`):
- Inherit from `Lutaml::Model::Serializable`
- Define attributes and XML mapping in `xml do ... end` block
- Use `map_element` to map child elements, `map_content` for text content
- Use `mixed_content` for elements that contain both text and child elements
- Use `w3c_attributes` for `xml:lang` and other W3C attributes

**Example element structure:**
```ruby
module Tbx
  class ConceptEntry < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang_sec, ::Tbx::LangSec, collection: true

    xml do
      root "conceptEntry"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "langSec", to: :lang_sec
    end
  end
end
```

**Autoload Pattern**: Elements are autoloaded via `lib/tbx.rb`. When adding new elements, add autoloads in alphabetical order.

### XML Namespace

The TBX namespace is `urn:iso:std:iso:30042:ed-2` defined in `Tbx::Namespaces::TbxNamespace`.

### TBX Styles

- **DCA** (Data Category Archive): Uses standard element names like `<transac type="transactionType">`, `<descrip type="definition">`
- **DCT** (Data Category Tagging): Uses module-namespaced elements like `<basic:transactionType>`, `<basic:definition>`

Currently DCA style is fully supported. DCT support will be added.

### Reference Data

- RNG/XSD schemas: `reference-docs/schemas/`
- TBX-Basic dialect examples: `reference-docs/schemas/TBX-Basic_dialect_v1/`
- Test fixtures: `spec/fixtures/TBX_test_files/` (from https://github.com/LTAC-Global/TBX_test_files)
