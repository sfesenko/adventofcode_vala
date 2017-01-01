
namespace day9 {

int uncompress_sequence(FileStream input) {
    char[] marker_array = {};
    int c;
    while((c = input.getc()) != ')') {
        char ch = (char)c;
        marker_array += ch;
    }
    marker_array += 0;
    int len, count;
    string marker = (string) marker_array;
    marker.scanf("%dx%d", out len, out count);

    // skip len chars
    for(int i = 0; i < len; ++i) {
        char ch = '1';
        do {
            ch = (char) input.getc();
        } while(ch.isspace());

    }
    int result = len * count;
    message(@"> $marker == $result");
    return result;
}

void process_stream(FileStream input) {
    int count = 0;
    int c;
    while((c = input.getc()) >= 0) {
        var ch = (char)c;
        if(ch.isspace()) {
            continue;
        }
        if(ch == '(') {
            count += uncompress_sequence(input);
            continue;
        }
        ++count;
    }
    stdout.puts(@"Count: $count\n");
}

void main(string[] argv) {
//    process_stdin();
    process_stream(stdin);
//
}

}

