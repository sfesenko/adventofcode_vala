using advent2015;

class Day13 : Day {

    HashTable<uint, int> happiness = new HashTable<uint, int>((i) => i, (a, b) => a == b);

    uint mk_idx (uint x, uint y) {
        return y * 10 + x;
    }

    uint populate_data (string data) {
        happiness.remove_all ();

        var name_index = new HashTable<string, uint> (str_hash, str_equal);

        foreach (var line in data.split ("\n")) {
            var tokens = line.split (" ");
            var name1 = tokens [0];
            uint n1;
            if (name_index.contains (name1) ) {
                n1 = name_index [ name1 ];
            } else {
                n1 = name_index.length;
                name_index [ name1 ] = n1;
            }
            var name2 = tokens [ 10 ].slice (0, -1);
            uint n2;
            if (name_index.contains (name2) ) {
                n2 = name_index [ name2 ];
            } else {
                n2 = name_index.length;
                name_index [ name2 ] = n2;
            }
            var joy = int.parse (tokens [3]);
            if (tokens [2] == "lose") {
                joy = -joy;
            }
            happiness [ mk_idx (n1, n2) ] = joy;
            // debug (@" '$name1'~$n1 -> '$name2'~$n2 == $joy");
        }
        return name_index.length;
    }

    int calculate_joy (uint8[] pos) {
        int result = 0;
        for (var i = 0; i < pos.length; ++i) {
            var left_i = (i == 0) ? pos.length - 1 : i - 1;
            var right_i = (i + 1 == pos.length) ? 0 : i + 1;
            var c = pos [ i ];
            var l = pos [ left_i ];
            var r = pos [ right_i ];
            result += happiness [mk_idx (c, l)] + happiness [ mk_idx (c, r)];
        }
        return result;
    }

    int recursive_joy_1 (uint len, uint8[] positions, uint n = 0, uint mask = 0) {
        if (n >= len) {
            return calculate_joy (positions);
        }
        var max_joy = int.MIN;
        for (var i = 0; i < len; ++i) {
            var mx = 1 << i;
            if ((mx & mask) > 0) {
                continue;
            }
            positions [n] = i;
            var joy = recursive_joy_1 (len, positions, n + 1, mask | mx);
            max_joy = int.max (max_joy, joy);
        }
        return max_joy;
    }

    int recursive_joy (uint length) {
        return recursive_joy_1 (length, new uint8 [ length ]);
    }

    uint first_u (string data) {
        var n = populate_data (data);
        return recursive_joy (n);
    }

    uint second_u (string data) {
        var n = populate_data (data);
        return recursive_joy (n + 1);
    }
}
