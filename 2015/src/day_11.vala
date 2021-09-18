using advent2015;

class Day11 : Day {

    char[] increment (char[] array, uint n = 0) {
        if (n >= array.length) {
          var a = array;
          a += 'a';
          return a;
        }
        char ch = array [n] + 1;
        
        if (ch == 'i' || ch == 'o' || ch == 'l') {
            ch += 1;
        }
        
        if (ch > 'z') {
            array [n] = 'a';
            return increment (array, n + 1);
        }
        array [n] = ch;
        return array;
    }

    bool check1 (char[] data) {
        char? a = null;
        char b = data[0];
        uint ch1 = 0;
        uint ch3 = 0;
        for (var i = 1; i < data.length; ++i) {
            var c = data [i];
            if (a != null && c + 1 == b && b + 1 == a) {
                ch1 += 1;
            }
            if (c == b && c != a) {
                ch3 += 1;
            }
            a = b;
            b = c;
        }
        var result = ch1 > 0 && ch3 > 1;
        // debug (@"[$(to_string(data))] == $result");
        return result;
    }

    string to_string (char[] array) {
        var b = new StringBuilder ();
        for (var i = array.length - 1; i >= 0; --i) {
            b.append_unichar (array[i]);
        }
        return b.str;
    }

    char[] next_pwd (char[] pwd) {
        var array = pwd;
        // debug (@"input = $(to_string(array))");
        while ( !check1 (array) ) {
            // var s = to_string(array);
            // debug (@"> [$s]");
            array = increment (array);
        }
        return array;

    }

    string first (string data) {
        var pwd_array = next_pwd (data.reverse().to_utf8 ());
        var pwd = to_string (pwd_array);
        return pwd;
    }

    string second (string data) {
        var pwd_array = next_pwd (data.reverse().to_utf8 ());
        pwd_array = increment (pwd_array);
        pwd_array = next_pwd (pwd_array);
        var pwd = to_string (pwd_array);
        return pwd;
    }
}
