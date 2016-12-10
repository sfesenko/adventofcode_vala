project('Day 3: Squares With Three Sides', 'c', 'vala')

src = [
    'Third.vala'
]

all_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
]

exe = executable(
    'Third',
    sources : src,
    dependencies : all_deps,
    install : true
)

test('first test', exe)

