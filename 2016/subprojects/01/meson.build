project('Day_1_No_Time_for_a_Taxicab', 'c', 'vala')

src = [
    'first.vala'
]

all_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
     dependency('gee-0.8'),
]

exe = executable(
    'first',
    sources : src,
    dependencies : all_deps,
    install : true
)

test('first test', exe)

