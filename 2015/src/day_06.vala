using advent2015;

class Day6 : Day {

    // return { xy, y1, x2, y2 };
    uint[] parse (string line, string prefix) {
        var e1 = line.index_of_char (' ', prefix.length + 1);
        var (x1, y1) = line.slice (prefix.length + 1, e1).split (",");
        var e2 = line.last_index_of_char (' ');
        var (x2, y2) = line.substring (e2).split (",");

        return { uint.parse (x1), uint.parse (y1), uint.parse (x2), uint.parse (y2) };
    }

    uint first_u (string data) {
        bool[,] screen = new bool [1000,1000];
        foreach (var line in data.split ("\n")) {
            if (line.length == 0) {
                continue;
            }
            if (line.has_prefix ("turn on")) {
                var (x1, y1, x2, y2) = parse (line, "turn on");
                for (uint y = y1; y <= y2; ++y) {
                    for (uint x = x1; x <= x2; ++x) {
                        screen[y, x] = true;
                    }
                }
            } else if (line.has_prefix ("turn off")) {
                var (x1, y1, x2, y2) = parse (line, "turn off");
                for (uint y = y1; y <= y2; ++y) {
                    for (uint x = x1; x <= x2; ++x) {
                        screen[y, x] = false;
                    }
                }

            } else if (line.has_prefix ("toggle")) {
                var (x1, y1, x2, y2) = parse (line, "toggle");
                for (uint y = y1; y <= y2; ++y) {
                    for (uint x = x1; x <= x2; ++x) {
                        screen[y, x] ^= true;
                    }
                }
            }
        }
        var count = 0;
        foreach (var t in screen) {
            count += t ? 1 : 0;
        }
        return count;
    }

    uint second_u (string data) {
        var table = new uchar [1000, 1000];
        string[] instrunctions = { "turn on", "turn off", "toggle" };
        foreach (var line in data.split ("\n")) {
            if (line.length == 0) {
                continue;
            }
            string key = "";
            foreach (var prefix in instrunctions) {
                if (line.has_prefix (prefix)) {
                    key = prefix;
                    break;
                }
            }
            var (x1, y1, x2, y2) = parse (line, key);
            for (uint y = y1; y <= y2; ++y) {
                for (uint x = x1; x <= x2; ++x) {
                    var v = table [y, x];
                    switch (key) {
                        case "turn on":
                            v += 1;
                            break;
                        case "turn off":
                            v = (v > 0) ? v - 1 : 0;
                            break;
                        case "toggle":
                            v += 2;
                            break;
                    }
                    table [y, x] = v;
                }
            }
        }
        uint result = 0;
        foreach (var t in table) {
            result += t;
        }
        return result;
    }
}

