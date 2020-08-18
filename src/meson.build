adventofcode2015_sources = [
  'commons.vala',
  'day_01.vala',
  'day_02.vala',
  'main.vala',

]

adventofcode2015_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
]

executable('adventofcode2015', adventofcode2015_sources,
  vala_args: '--target-glib=2.58',  dependencies: adventofcode2015_deps,
  install: true,
)
