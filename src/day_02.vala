using advent2015;

class Day2 : Day {

    delegate uint formula (uint a, uint b, uint c);

    uint process_file (string data, formula f) {
        var lines  = data.split ("\n");
        ulong total = 0;
        foreach (var line in lines) {
            if (line == null || line.length < 5) {
                continue;
            }
            var (a, b, c) = line.split ("x");
            var l = uint.parse (a), w = uint.parse (b), h = uint.parse (c);
            var el = f (l, w, h);
            total += el;
        }
        uint result = (uint) total;
        assert (result == total);
        return result;

    }

    uint first (string data) {
        formula wrapping = (l, w, h) => {
            var lw = l*w, wh = w*h, hl = h*l;
            var sq = (lw + wh + hl) * 2 + min (lw, wh, hl);
            return sq;
        };
        return process_file (data, wrapping);
    }

    uint second (string data) {
        formula ribbon = (l, w, h) => {
            uint a, b;
            var mx = max (l, w, h);
            if ( l == mx) {
                a = w;
                b = h;
            } else if (w == mx) {
                a = l;
                b = h;
            } else if (h == mx) {
                a = l;
                b = w;
            } else {
                error ("incorrect logic");
            }
            return (a + b) * 2 + l * w * h;
        };
        return process_file (data, ribbon);
    }
}

