using advent2015;

class Day17 : Day {

    int[] get_data (string input) {
        var lines = input.split ("\n");
        var result = new int [lines.length];
        for (var i = 0; i < lines.length; ++i) {
            result [i] = int.parse (lines [i]);
        }
        return result;
    }

    uint recursive (int size, int[] containers, uint n = 0, HashTable<string, uint?> hash = new HashTable<string, uint?> (str_hash, str_equal)) {
        if (size == 0) {
            return 1;
        }
        if (size < 0 || n >= containers.length) {
            return 0;
        }
        var key = @"$(n)_$(size)";
        if (hash.contains (key)) {
            return hash [ key ];
        }
        var res = recursive (size - containers[n], containers, n + 1, hash)
            + recursive (size, containers, n + 1, hash);
        hash [ key ] = res;
        return res;
    }

    uint first_u (string data) {
        var containers = get_data (data);
        var r = recursive (150, containers);
        return r;
    }

    HashTable<int, int> recursive_2 (int size, int[] containers, int n = 0, int len = 0, HashTable<string, HashTable<int, int>> hash = new HashTable<string, HashTable<int, int>> (str_hash, str_equal)) {
        if (size == 0) {
            var res = new HashTable<int, int> ((i) => i, (a, b) => a == b);
            res [len] = 1;
            return res;
        }
        if (size < 0 || n >= containers.length) {
            return new HashTable<int, int> ((a) => 1, (a, b) => a == b);
        }

        var key = @"$(n)_$(size)_$len";
        if (hash.contains (key)) {
            return hash [ key ];
        }
        var a = recursive_2 (size - containers[n], containers, n + 1, len + 1, hash);
        var b = recursive_2 (size, containers, n + 1, len, hash);

        var res = new HashTable<int, int> ((i) => i, (a, b) => a == b);
        a.foreach ((k, v) => {
            res[k] = v;
        });
        b.foreach ((k, v) => {
            var w = res [k];
            res[k] = w + v;
        });
        hash [ key ] = res;
        return res;
    }

    uint second_u (string data) {
        var containers = get_data (data);
        var r = recursive_2 (150, containers);
        var n = int.MAX;
        foreach (var k in r.get_keys ()) {
            n = int.min (n, k);
        }
        return r [ n ];
    }
}
