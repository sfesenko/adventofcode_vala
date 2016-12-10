project('Day 2: Bathroom Security', 'c', 'vala')

src1 = [
    'Second1.vala',
]

src2 = [
    'Second2.vala'
]

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

all_deps = [ glib, gobject ]

exe1 = executable(
    'second1',
    sources : src1,
    dependencies : all_deps,
    install : true
)

exe2 = executable(
    'second2',
    sources : src2,
    dependencies : all_deps,
    install : true
)


#test('Second test', exe1, exe2)

