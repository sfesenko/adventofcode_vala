using advent2015;

class Day3 : Day {

    uint first (string data) {
        var places = new GenericSet<string> (str_hash, str_equal);
        int x = 0, y = 0;
        places.add (@"$x-$y");

        foreach (var ch in data.to_utf8() ) {
            switch (ch) {
                case '>':
                    x += 1;
                    break;
                case '<':
                    x -= 1;
                    break;
                case '^':
                    y += 1;
                    break;
                case 'v':
                    y -= 1;
                    break;
             }
            places.add (@"$x-$y");
        }
        return places.length;
    }

    inline void swap (ref int a, ref int b) {
        var _t = a;
        a = b;
        b = _t;
    }

    uint second (string data) {
        var places = new GenericSet<string> ((s) => s.hash(), (a, b) => a == b);
        int x = 0, y = 0;
        int x1 = 0, y1 = 0;
        places.add (@"$x-$y");

        foreach (var ch in data.to_utf8() ) {
            switch (ch) {
                case '>':
                    x += 1;
                    break;
                case '<':
                    x -= 1;
                    break;
                case '^':
                    y += 1;
                    break;
                case 'v':
                    y -= 1;
                    break;
             }
            places.add (@"$x-$y");
            swap (ref x, ref x1);
            swap (ref y, ref y1);
        }
        return places.length;
    }
}

