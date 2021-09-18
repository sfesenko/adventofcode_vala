project('Day 6: Signals and Noise', 'c', 'vala')

src_1 = [
    'common.vala',
    'noise1.vala'
]

src_2 = [
    'common.vala',
    'noise2.vala'
]

all_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8')
]

exe1 = executable(
    'noise1',
    sources : src_1,
    dependencies : all_deps,
    install : true
)

#exe2 = executable(
#    'noise2',
#    sources : src_2,
#    dependencies : all_deps,
#    install : true
#)

test('test1', exe1 )
#test('test2', exe2 )

