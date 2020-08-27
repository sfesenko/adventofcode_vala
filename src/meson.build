adventofcode2015_sources = [
  'commons.vala',
  'day_01.vala',
  'day_02.vala',
  'day_03.vala',
  'day_04.vala',
  'day_05.vala',
  'day_06.vala',
  'day_07.vala',
  'day_08.vala',
  'day_09.vala',
  'day_10.vala',
  'day_11.vala',
  'day_12.vala',
  'day_13.vala',
  'day_14.vala',
  'day_15.vala',
  'day_16.vala',
  'day_17.vala',
  'day_18.vala',
  
  'day_x.vala',
  'main.vala',

]

cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required : false)

adventofcode2015_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
  dependency('json-glib-1.0'),
  m_dep
]


executable('adventofcode2015', adventofcode2015_sources,
  vala_args: '--target-glib=2.58',  dependencies: adventofcode2015_deps,
  install: true,
)
