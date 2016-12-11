project('Day 4: Security Through Obscurity', 'c', 'vala')

src_1 = [
    'md5.vala',
    'hashangen1.vala'
]

src_2 = [
    'md5.vala',
    'hashangen2.vala'
]

all_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8')
]

exe1 = executable(
    'hashangen1',
    sources : src_1,
    dependencies : all_deps,
    install : true
)

exe2 = executable(
    'hashangen2',
    sources : src_2,
    dependencies : all_deps,
    install : true
)

test('test1', exe1 )
test('test2', exe2 )

