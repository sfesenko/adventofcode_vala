project('Day 2: Bathroom Security', 'c', 'vala')

src = [
    'Second.vala',
]

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

all_deps = [ glib, gobject ]

exe = executable(
    'second',
    sources : src,
    dependencies : all_deps,
    install : true
)

test('Second test', exe)

