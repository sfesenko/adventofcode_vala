using advent2015;

class Day4 : Day {

    delegate bool is_coin_predicate (string hash);

    static uint find_coin (string data, is_coin_predicate is_coin) {
        var secret = data.strip ();
        uint a = 0;
        do {
            var code = secret + a.to_string();
            var hash = Checksum.compute_for_string (ChecksumType.MD5, code);
            if (is_coin(hash)) {
                // debug (@"> hash($code) == $hash");
                return a;
            }
            a += 1;
        } while (a < 1 << 24);
        return 0;
    }

    uint first (string data) {
        is_coin_predicate easy_coin = (h) => h.has_prefix ("00000");
        return find_coin (data, easy_coin);
    }

    uint second (string data) {
        is_coin_predicate is_coin = (h) => h.has_prefix ("000000");
        return find_coin (data, is_coin);
    }
}

