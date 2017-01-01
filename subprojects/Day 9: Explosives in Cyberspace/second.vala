
namespace day9_2 {

int process_sequence(FileStream input) {
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

    char[] uncompressed = {};
    for(int i = 0; i < len; ++i) {
        char ch = '1';
        do {
            ch = (char) input.getc();
            uncompressed += ch;
        } while(ch.isspace());

    }
    for(int i = 0; i < count; ++i) {
        for(int j = uncompressed.length - 1; j >=  0; --j) {
            char ch = uncompressed[j];
            input.ungetc(ch);
        }
    }
    return len * count;
/*
    uncompressed += 0;
    string uncompressed_str = (string) uncompressed;
    message(uncompressed_str);
*/
}

void process_stream(FileStream input) {
    long count = 0;
    long bonus = 0;
    int c;
    while((c = input.getc()) >= 0) {
        var ch = (char)c;
        if(ch.isspace()) {
            continue;
        }
        if(ch == '(') {
            bonus += process_sequence(input);
            continue;
        }
        // stdout.putc(ch);
        ++count;
        if( count % 10000000 == 0) {
            stdout.printf("\rDone = %ld, Bonus = %ld, Delta = %ld", count, bonus, bonus - count);
        }
    }
    stdout.puts(@"\nCount: $count\n");
}

void main(string[] argv) {
//    process_stdin();
    process_stream(stdin);
//
}

}

