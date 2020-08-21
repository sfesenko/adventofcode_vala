using advent2015;

class Day1 : Day {

    uint first_u (string data) {
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

    uint second_u (string data) {
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

