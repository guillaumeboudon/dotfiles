// md2pdf — Mipise style, injected by pandoc (-H) to override its default `conf`.

#let assets = sys.inputs.at("assets", default: ".")
#let logo   = assets + "/logo.png"

#let blue        = rgb("#034EA2")
#let red         = rgb("#F04E3E")
#let ink         = rgb("#1C0402")
#let dark        = rgb("#181818")
#let grey        = rgb("#767676")
#let quote-grey  = rgb("#4F4F54")
#let rule        = rgb("#C5C5C5")
#let header-fill = rgb("#ECECEC")
#let code-bg     = rgb("#F5F8FA")
#let body-font   = "Arial"
#let code-font   = "DejaVu Sans Mono"

#let conf(title: none, subtitle: none, date: none, lang: "fr", region: "FR", sectionnumbering: none, doc, ..rest) = {
  let on-cover() = title != none and here().page() == 1

  set document(title: title)
  set text(font: body-font, size: 12pt, fill: ink, lang: lang, region: region)
  set par(justify: true, leading: 0.85em, spacing: 16pt)

  set page(
    paper: "a4",
    margin: (x: 2cm, top: 2cm, bottom: 2.54cm),
    background: context if on-cover() {
      show underline: it => it.body
      place(top + left, dx: 2cm, dy: 1.6cm, image(logo, width: 4.3cm))
      place(top + right, dx: -2cm, dy: 1.6cm,
        link("https://mipise.com", text(weight: "bold", fill: red, "mipise.com")))
    },
    footer: context {
      set text(size: 10pt, fill: blue)
      set par(justify: false)
      if on-cover() {
        align(right, date)
      } else {
        grid(columns: (auto, 1fr), column-gutter: 12pt, align: (left + horizon, right + horizon),
          image(logo, width: 2.3cm),
          (title, if date != none { date }, counter(page).display()).filter(it => it != none).join(" | "))
      }
    },
  )

  set list(marker: ([•], [–], [•]), spacing: 12pt) // Arial has no "‣", typst's default 2nd-level marker
  set enum(spacing: 12pt)

  set heading(numbering: sectionnumbering)
  show heading: set text(weight: "regular", fill: red)
  show heading: set par(justify: false)
  show heading: set block(above: 26pt, below: 12pt)
  show heading.where(level: 1): set block(above: 34pt)
  show heading.where(level: 1): set text(size: 20pt)
  show heading.where(level: 2): set text(size: 18pt, fill: blue)
  show heading.where(level: 3): set text(size: 16pt)
  show heading.where(level: 4): set text(size: 14pt, fill: dark)
  show heading.where(level: 5): set text(size: 14pt, fill: grey)
  show outline.entry.where(level: 1): set text(weight: "bold")

  show link: set text(fill: red)
  show link: underline
  show terms: it => it.children.map(item => block(below: 0.8em, {
    strong(item.term)
    block(above: 0.4em, inset: (left: 1.5em), item.description)
  })).join()
  show quote.where(block: true): it => block(above: 16pt, below: 16pt, stroke: (left: 2pt + blue), inset: (left: 12pt, y: 2pt), text(fill: quote-grey, it.body))

  show divider: block(above: 24pt, below: 24pt, line(length: 100%, stroke: 0.75pt + blue))

  show raw: set text(font: code-font, size: 10pt)
  show raw.where(block: true): set par(justify: false)
  show raw.where(block: true): block.with(fill: code-bg, stroke: (left: 2pt + blue), inset: 10pt, radius: 2pt, width: 100%)

  set table(stroke: 0.5pt + rule, inset: (x: 5.4pt, y: 5pt), fill: (_, y) => if y == 0 { header-fill })
  show table: set par(justify: false)
  show table.cell.where(align: auto): set align(left)
  show figure.where(kind: table): set block(breakable: true)
  show table.cell.where(y: 0): set text(weight: "bold", fill: dark)

  if title != none {
    v(3.2cm)
    block(below: 0.6em, par(justify: false, text(size: 32pt, fill: blue, title)))
    if subtitle != none { block(text(size: 20pt, fill: red, subtitle)) }
    v(12pt)
  }
  doc
}
