#import "@preview/codelst:2.0.0": sourcecode, sourcefile

#let date = datetime.today().display()
#set page(paper: "a4", margin: 1.5cm)

#set text(
  lang: "ja",
  font: "UDEV Gothic NF",
)

#align(center, text(20pt)[
  title
])

#align(center, text(12pt)[
  学籍番号: #h(1cm) クラス名: #h(1cm) 氏名: \
  締切日: \
  提出日: #date
])

