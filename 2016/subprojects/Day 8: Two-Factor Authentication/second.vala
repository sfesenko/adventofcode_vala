
using Gee;

namespace day8_2 {

string invert(string ip) {
    char[] array = ip.to_utf8();
    array[0] = array[1];
    array[1] = array[2];
    array[2] = array[0];
    return (string) array;
}

bool has_ssl(string ip) {
    char[] array = ip.to_utf8();
    char a = 0, b = 0;
    bool brackets = false;
    var abas = new HashSet<string>();
    var babs = new HashSet<string>();

    foreach(var ch in array) {
        switch(ch) {
            case '[':
                brackets = true;
                break;
            case ']':
                brackets = false;
                break;
        }
        if(ch == a && ch != b) {
            var hash = (brackets) ? babs : abas;
            string s = (string) new char[] {a, b, a};
            hash.add(s);
        }
        a = b;
        b = ch;
    }

    foreach(var s in babs) {
        var inverted = invert(s);
        if(abas.contains(inverted)) {
            message(ip);
            return true;
        }
    }
    return false;
}


void process_stdin() {
    string line;
    int count = 0;
    while((line = stdin.read_line()) != null) {
        count += (int) has_ssl(line);
    }
    stdout.puts(@"Count SSL == $count\n");
}

void main(string[] argv) {

    assert(invert("aba") == "bab");
    assert(has_ssl("aba[bab]xyz") == true);
    assert(has_ssl("xyx[xyx]xyx") == false);
    assert(has_ssl("aaa[kek]eke") == true);
    assert(has_ssl("zazbz[bzb]cdb") == true);
    process_stdin();
}



}

