namespace advent2015 {


uint day_11 (string content) {
    var count = 0;
    foreach (var c in content.to_utf8() ) {
        switch (c) {
            case '(':
                count += 1;
                break;
            case ')':
                count -= 1;
                break;
        }
    }
    message (@"Result: $count");
    return count;
}


uint day_12 (string content) {
    var chars = content.to_utf8 ();
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
    return -1;
}


}
