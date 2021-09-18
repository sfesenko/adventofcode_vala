/**
 *
 */
[Compact]
enum Suxxpad {
    _1 = 0,
    _2,
    _3,
    _4,
    _5,
    _6,
    _7,
    _8,
    _9,
    _A,
    _B,
    _C,
    _D;

    const Suxxpad[] _up =     {_1, _2, _1, _4, _5, _2, _3, _4, _9, _6, _7, _8, _B};
    const Suxxpad[] _right =  {_1, _3, _4, _4, _6, _7, _8, _9, _9, _B, _C, _C, _D};
    const Suxxpad[] _down =   {_3, _6, _7, _8, _5, _A, _B, _C, _9, _A, _D, _C, _D};
    const Suxxpad[] _left =   {_1, _2, _2, _3, _5, _5, _6, _7, _8, _A, _A, _B, _D};
    const char[] _to_char =  {'1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D'};


    public Suxxpad up() {
        return _up[this];
    }

    public Suxxpad down() {
        return _down[this];
    }

    public Suxxpad left() {
        return _left[this];
    }

    public Suxxpad right() {
        return _right[this];
    }

    public Suxxpad move(char ch) {
        Suxxpad result;
        switch(ch) {
            case 'U':
                result = up();
                break;
            case 'L':
                result = left();
                break;
            case 'D':
                result = down();
                break;
            case 'R':
                result = right();
                break;
            default:
                error(@"Illegal move: '$ch'");
        }
        debug("'%c' == %s -> %s", ch, this.to_string(), result.to_string());
        return result;
    }

    public char to_char() {
        return _to_char[this];
    }
}

void main(string[] argv) {
    var f = FileStream.open("input.txt", "r");
    assert (f != null);
    string? line;
    Suxxpad pad = Suxxpad._5;
    while((line = f.read_line()) != null) {
        foreach(char ch in line.to_utf8()) {
            pad = pad.move(ch);
        }
        stdout.printf("%c", pad.to_char());
    }
    stdout.puts("\nDone!\n");
}

