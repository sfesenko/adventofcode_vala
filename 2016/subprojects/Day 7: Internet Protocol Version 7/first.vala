
namespace day7 {

bool is_ip(string s) {
    char prev = '\0';
    bool brackets = false;
    bool repeated = false;
    char[] line = s.to_utf8();
    bool result = false;
    for(int i = 0; i < line.length; ++i) {
        var ch = line[i];
        if(repeated && ch != prev && i > 2 && line[i-3] == ch) {
            if(brackets) {
                result = false;
                break;
            }
            result = true;
        }
        repeated = ch == prev;
        brackets = brackets || ch == '[';
        if(brackets && ch == ']') {
            brackets = false;
        }
        prev = ch;
    }

    return result;
}


void process_stdin() {
    string line;
    int count = 0;
    while((line = stdin.read_line()) != null) {
        count += (int) is_ip(line);
    }
    stdout.puts(@"Count TLS == $count");
}

void main(string[] argv) {
    assert( is_ip("abba[mnop]qrst") == true);
    assert( is_ip("abcd[bddb]xyyx") == false);
    assert( is_ip("aaaa[qwer]tyui") == false);
    assert( is_ip("ioxxoj[asdfgh]zxcvbn") == true);
    process_stdin();
}

}

