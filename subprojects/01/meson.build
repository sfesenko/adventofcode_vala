project('Day 1: No Time for a Taxicab', 'c', 'vala')

src = [
    'first.vala'
]

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

all_deps = [ glib, gobject ]

exe = executable(
    'first',
    sources : src,
    dependencies : all_deps,
    install : true
)

test('first test', exe)

