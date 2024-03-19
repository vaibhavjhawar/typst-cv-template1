// ==================================================
// 
// Typst Resume/CV Template
// https://github.com/vaibhavjhawar/typst-cv-template1
// 
// Inspired by Alessandro Plasmati's Graduate CV LaTex template
// 
// MIT License
// 
// Requires:
// - Typst CLI (https://github.com/typst/typst/)
// - Fontin Fonts (http://www.exljbris.com/fontin.html)
// 
// ==================================================



// ==================================================
// Config
// ==================================================

// Page and Text Setup
#set page(paper: "a4", margin: (x: 3cm, y: 2cm)) //"us-letter"
#set text(font: "Fontin", size: 10pt)
#set par(justify: false, leading: 0.45em)

// SmallCaps Function for Fontin Fonts
#let sc(body) = {
  set text(font: "Fontin SmallCaps")
  [#body]
}

// Full Name Title Function
#let title(first_name: none, last_name: none) = {
  set align(center)
  set text(font: "Fontin", size: 24pt)
  [#first_name]
  h(2.5mm)
  set text(font: "Fontin SmallCaps", size: 24pt)
  [#last_name]
  v(7.5mm)
}

// Setting Heading as Section Titles
#show heading: myhead => [
  #v(-1.25mm)
  #set text(font: "Fontin SmallCaps", weight: "regular")
  #myhead
  #v(-4.5mm)
  #set line(length: 100%, stroke: 0.2mm)
  #line()
  #v(-1mm)
]

#let info(info_dict: none) = {
  grid(
    columns: (30%, auto),
    gutter: 3mm,
    align(right)[
      #for key in info_dict.keys() {
        sc(key); linebreak()
      }
    ],
    align(left)[
      #for value in info_dict.values() {
        value; linebreak()
      }
    ],
  )
}

#let work(
  date_range: none,
  position: none,
  org: none,
  addr: none,
  desc: none,
  ) = {
    v(1.2mm)
    table(
      columns: (15%, auto),
      align: (right, left),
      row-gutter: -1.75mm,
      stroke: none,
      table.cell(rowspan: 5, inset: (top: 0.25mm))[#sc([#date_range])],
      table.vline(stroke: 0.25mm),
      table.cell(inset: (top: 0.25mm))[#position],
      [#emph(org)],
      [#addr],
      (v(-1.25mm)),
      table.cell(inset: (bottom: 0.25mm))[#text(size: 9pt, desc)],
    )
}

#let to() = {
  set text(font: "Fontin", size: 8pt)
  align(center)[to]
}

#let skill(skill_dict: none) = {
  grid(
    columns: (25%, auto),
    gutter: 3mm,
    align(right)[
      #for key in skill_dict.keys() {
        sc(key); linebreak()
      }
    ],
    align(left)[
      #for value in skill_dict.values() {
        value; linebreak()
      }
    ],
  )
}

#let edu(date_range: none, degree: none, grade: none, uni: none, addr: none) = {
  table(
    columns: (15%, auto),
    align: (right, left),
    row-gutter: -1.75mm,
    stroke: none,
    table.cell(rowspan: 3)[#sc([#date_range])], [#degree #h(2mm)|#h(2mm) #grade],
    [#uni],
    [#addr],
  )
  v(-3.5mm)
}

#let project(
  date_range: none,
  title: none,
  org: none,
  addr: none,
  desc: none,
  ) = {
    table(
      columns: (15%, auto),
      align: (right, left),
      row-gutter: -1.75mm,
      stroke: none,
      table.cell(rowspan: 5, inset: (top: 0.25mm))[#sc([#date_range])],
      table.vline(stroke: 0.2mm),
      table.cell(inset: (top: 0.25mm))[#title],
      [#emph(org)],
      [#addr],
      (v(-1.25mm)),
      table.cell(inset: (bottom: 0.25mm))[#text(size: 9pt, desc)],
    )
}



// ==================================================
// Begin Document
// ==================================================

#title(
  first_name: "Firstname",   // this will be Sentence Case, none to omit
  last_name: "Lastname",  // this will be SmallCaps, none to omit
)

= Personal Data

#info(
  info_dict: (
    "Place and Date of Birth:": "Lorem, Amet – Jan 12, 1234",
    "Address:"                : "Ipsum, XY – 01234 ABC", 
    "Phone:"                  : link("tel:123456789"),
    "Email:"                  : link("mailto:email@email.com"),
  )
)

= Work Experience

#work(
  date_range: list(marker: [],
    [feb 1000],   // start date
    [#to()],      // comment this for single date
    [present],   // end date - comment this for single date
  ),
  position: "Senior Software Engineer",
  org: "Some Software Company",
  addr: "Dolor, Sit Amet",
  desc: list(
    [Lorem ipsum dolor sit amet, consectetur adipiscing elit.],
    [sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.],
    [Ut enim ad minim veniam, quis nostrud exercitation ullamco.],
    [Laboris nisi ut aliquip ex ea commodo consequat, duis aute irure.],
  ),
)

#work(
  date_range: list(marker: [],
    [jan 1000],   // start date
    [#to()],      // comment this for single date
    [feb 1000],   // end date - comment this for single date
  ),
  position: "Junior Software Engineer",
  org: "Some Software Company",
  addr: "Dolor, Sit Amet",
  desc: list(
    [Dolor in reprehenderit in voluptate velit esse cillum dolore eu.],
    [Fugiat nulla pariatur, excepteur sint occaecat cupidatat non.],
    [Proident, sunt in culpa qui officia deserunt mollit anim id est laborum.],
  ),
)

= Skills

#skill(
  skill_dict: (
    "Lectus Sit:"  : "Amet, Placerat, IN, Egestas, Erat, Imperdiet, Euismod",
    "Nisi Porta:"  : "Lorem, Mollis, Aliquam, UT, Porttitor, Loa, Diam",
    "Tempor:"      : "Ipsum, Faucibus, Vitae, Aliquet, NEC", 
    "Ullamcorper:" : "Sitamet, Risus, Nullam, Felis, Eget, Nunc, Lobortis, Mattis",
  )
)

= Education

#edu(
  degree: "PhD in Physics",
  grade: "99%",
  uni: "University of Lorem Ipsum",
  addr: "Dolor, Sit Amet",
  date_range: list(marker: [],
    [1905],   // start date
    // [#to()],      // uncomment this for date range
    // [feb 1000],   // end date - uncomment this for date range
  ),
)

#edu(
  degree: "Master of Science in Physics",
  grade: "GPA 3.9/4.0",
  uni: "University of Lorem Ipsum",
  addr: "Dolor, Sit Amet",
  date_range: list(marker: [],
    [1900],   // start date
    [#to()],      // uncomment this for date range
    [1890],   // end date - uncomment this for date range
  ),
)

= Projects

#project(
  date_range: list(marker: [],
    [jan 1000],   // start date
    [#to()],      // comment this for single date
    [feb 1000],   // end date - comment this for single date
  ),
  title: "My Project 1 Title",
  org: "This is the desription of my project",
  addr: "Dolor, Sit Amet",
  desc: list(
    [Lorem ipsum dolor sit amet, consectetur adipiscing elit.],
    [sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.],
    [Ut enim ad minim veniam, quis nostrud exercitation ullamco.],
  ),
)

#project(
  date_range: list(marker: [],
    [jan 1000],   // start date
    [#to()],      // comment this for single date
    [feb 1000],   // end date - comment this for single date
  ),
  title: "My Project 2 Title",
  org: "My organization name",
  addr: "Dolor, Sit Amet",
  desc: list(
    [Lorem ipsum dolor sit amet, consectetur adipiscing elit.],
    [sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.],
    [Ut enim ad minim veniam, quis nostrud exercitation ullamco.],
  ),
)

// ==================================================
// End Document
// ==================================================

// ==================================================

