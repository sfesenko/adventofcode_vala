using advent2015;

class Day1 : Day {

    public uint first (string data) {
        var count = 0;
        foreach ( var c in data.to_utf8() ) {
            switch (c) {
                case '(':
                    count += 1;
                    break;
                case ')':
                    count -= 1;
                    break;
            }
        }
        return count;
    }

    public uint second (string data) {
        var chars = data.to_utf8 ();
        var count = 0;
        for (var i = 0; i < chars.length; ++i) {
            var c = chars [i];
            switch (c) {
                case '(':
                    count += 1;
                    break;
                case ')':
                    count -= 1;
                    break;
            }
            if (count == -1) {
                return i + 1;
            }
        }
        return 0;
    }
}

