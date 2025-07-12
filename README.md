# Typst Template for Writing Japanese Report

## Preview
```typ
// main.typ

#import "@local/template:0.1.0": *
#show: style.default

#template.title(
  title: "XXXXX",
  subtitle: "xxxxx",

  [学籍番号],
  [XXXXXXXXXX],

  [所属],
  [X学部],

  [学年],
  [X回生],

  [氏名],
  [Name Here],
)
```
<img width="747" height="1055" alt="Screenshot 2025-07-13 at 03-34-24 Typst Preview" src="https://github.com/user-attachments/assets/2539f43f-53cb-4749-acbd-4691bab4b575" />


## Installation

1. Clone this repository
2. Run install.sh

## Dependenceis
### Fonts
- Hiragino Mincho Pro
- Hack Nerd Font Mono

## Usage

### Import plugin as local
```typ
#import "@local/template:0.1.0": style, template

```

### Apply default styles
```typ
#show: style.default

```
It changes these styles:
  - font: Use "Hiragino Mincho Pro" and "Hack Nerd Font Mono"
  - table: Change supplement of tables to 「表」and 「図」

### Insert title page
```typ
#template.title(
  title: "XXXXX",
  subtitle: "xxxxx",

  [学籍番号],
  [XXXXXXXXXX],

  [所属],
  [X学部],

  [学年],
  [X回生],

  [氏名],
  [Name Here],
)
```
