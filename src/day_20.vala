using advent2015;

class Day20 : Day {

    int[] divisors (int a) {
        int[] result = {};
        var i = 1;
        while (i <= a / 2) {
            if (a % i == 0) {
                result += i;
            }
            i += 1;
        }
        result += a;
        return result;
    }

    uint first_u (string data) {
        var n = int.parse (data);
        var house = new uint [n / 10];
        for (var i = 1; i < n / 10; ++i) {
            for (var j = i; j < n / 10; j += i) {
                house[j] += i * 10;
            }
        }
        var i = 0;
        while (house[i++] < n);
        return i - 1;
    }

    uint second_u (string data) {
        var n = int.parse (data);
        var house_count = n / 10;
        var house = new uint [house_count];
        for (var elf_idx = 1; elf_idx < house_count; ++elf_idx) {
            var count = 0;
            for (var house_idx = elf_idx; house_idx < house_count; house_idx += elf_idx) {
                if (count++ > 50) {
                    break;
                }
                house[house_idx] += elf_idx * 11;
            }
        }
        var i = 0;
        while (house[i] < n) {
            i += 1;
        }
        return i;
    }
}
