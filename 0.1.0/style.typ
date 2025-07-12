#let font(body) = {
  show: text.with(
    font: ("Hiragino Mincho Pro", "Hack Nerd Font Mono"),
    size: 0.8em,
  )

  body
}

#let figure-style(body) = {
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set figure(supplement: "表")
  show figure.where(kind: image): set figure(supplement: "図")

  body
}

#let default(body) = {
  show: text.with(
    font: ("Hiragino Mincho Pro", "Hack Nerd Font Mono"),
    size: 0.8em,
  )

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set figure(supplement: "表")
  show figure.where(kind: image): set figure(supplement: "図")

  body
}
