## [Unreleased]

### Added

- `Tbx::DataElement` shared concern — DRY module injecting common data-category
  attributes (id, lang, target, datatype, type, content) via `included` hook
- `Tbx::DataElement::InlineContent` sub-concern for elements with `entity.noteText`
  content model (hi, ec, foreign, ph, sc inline children)
- `Tbx::Modules::Min` — Min module TYPES/VALUES constants (Min.tbxmd)
- `Tbx::Modules::Basic` — Basic module TYPES/VALUES constants (Basic.tbxmd)
- `Tbx::Modules::Linguist` — Linguist module TYPES/VALUES constants (Linguist.tbxmd)
- `Tbx::Modules::CoreTypes` — Core RNG hi type constants
- TYPES constants on all data-category elements (Admin, AdminNote, Descrip,
  TermNote, Ref, Xref, Transac, TransacNote, Hi), composed from module hashes
- VALUES constants on TermNote (picklist enums) and Transac (transaction types)
- `Tbx::TermComp` — term component element `<termComp>` (TermComp module)
- `Tbx::TermCompGrp` — term component group `<termCompGrp>` (TermComp module)
- `Tbx::TermCompSec` — term component section `<termCompSec>` (TermComp module)
  with TYPES for 5 decomposition methods
- Comprehensive YARD RubyDoc on all element classes tracing schema/module sources
- 119 new specs (165 total) covering TYPES/VALUES, DataElement concern, and
  XML round-trips for all data-category elements and TermComp elements

### Changed

- Data-category elements (Admin, Descrip, TermNote, AdminNote, DescripNote,
  TransacNote, Transac, Ref) now use `include Tbx::DataElement` instead of
  explicit attribute declarations
- `Tbx::TermNote::TYPES` now composes from Min + Basic + Linguist (9 types)
- `Tbx::Sc` aligned with core RNG: removed type, subtype, target attributes
  (only id and isolated per RNG)
- Reference documentation downloaded from 12 LTAC-Global repositories into
  `reference-docs/schemas/` with acknowledgements

## [0.1.1] - 2026-05-05

- Simplify `Tbx::Namespaces::TbxNamespace` to `Tbx::Namespace`
- Fix submodule reference for test fixtures in CI
- Use git source for lutaml-model dependency in CI

## [0.1.0] - 2026-05-05

- Initial release
