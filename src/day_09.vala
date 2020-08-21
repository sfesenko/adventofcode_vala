using advent2015;

class Day9 : Day {

    HashTable<string, uint> city_index = new HashTable<string, uint> (str_hash, str_equal);
    HashTable<uint, uint> city_distance = new HashTable<uint, uint> ((i) => i, (a, b) => a == b);

    // map 2-dimension array index into 1-dimension array index
    uint get_index (uint x, uint y) {
        return y * 100 + x;
    }

    void populate_tables (string data) {
        city_index.remove_all ();
        city_distance.remove_all ();

        foreach (var line in data.split ("\n")) {
            var t = line.split (" ");
            if (t.length < 5) {
                continue;
            }
            uint x, y;
            var city1 = t[0];
            var city2 = t[2];
            var distance = uint.parse (t[4]);

            if (city_index.contains (city1)) {
                x = city_index [ city1 ];
            } else {
                x = city_index.length;
                city_index [ city1 ] = x;
            }
            if (city_index.contains ( city2 ) ) {
                y = city_index [ city2 ];
            } else {
                y = city_index.length;
                city_index [ city2 ] = y;
            }
            city_distance [get_index(x, y)] = distance;
            city_distance [get_index(y, x)] = distance;
        }
        /*
        city_distance.@foreach ((k, v) => {
            debug (@"[$k] == $v");
        });
        */
    }

    uint min_distance (ReduceArray<uint> select_result, uint n = 0, int prev = -1, uint result = 0, uint mask = 0) {
        if (n >= city_index.length) {
            return result;
        }
        uint[] results = { };
        for (var current = 0; current < city_index.length; ++current) {
            var mx = 1 << current;
            if ((mask & mx) > 0) {
                continue;
            }
            var d = (prev < 0 || current == prev) ? 0 : city_distance [get_index(current, prev)];
            var r = min_distance (select_result, n + 1, current, result + d, (mask | mx));
            results += r;
        }
        return select_result (results);
    }

    uint first (string data) {
        populate_tables (data);
        var v = min_distance ((a) => {
            uint r = uint.MAX;
            foreach (var n in a) {
                if (n < r) {
                    r = n;
                }
            }
            return r;
        });
        return v;
    }

    uint second (string data) {
        var v = min_distance ((a) => {
            uint r = uint.MIN;
            foreach (var n in a) {
                if (n > r) {
                    r = n;
                }
            }
            return r;
        });
        return v; 
    }
}
