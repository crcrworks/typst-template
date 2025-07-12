#let title(title: text, subtitle: text, ..cells) = {
  align(right, text()[
    #text[作成日] #datetime.today().display("[year]年[month]月[day]日")
  ])

  v(150pt)

  align(center, text(20pt)[
    *#title*
  ])
  align(center, text(14pt)[
    *#subtitle*
  ])

  v(1fr)

  align(right)[
    #table(
      columns: (auto, auto),
      align: (right, left),
      stroke: none,
      ..cells
    )
  ]

  pagebreak()
}
