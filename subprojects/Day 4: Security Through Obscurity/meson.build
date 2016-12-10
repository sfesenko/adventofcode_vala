project('Day 4: Security Through Obscurity', 'c', 'vala')

src = [
    'Forth.vala'
]

all_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8')
]

exe = executable(
    'forth',
    sources : src,
    dependencies : all_deps,
    install : true
)

test('first test', exe)

