/**
 *
 */
[Compact]
enum Keypad {
    _1 = 0,
    _2,
    _3,
    _4,
    _5,
    _6,
    _7,
    _8,
    _9;

    const Keypad[] _up =     {_1, _2, _3, _1, _2, _3, _4, _5, _6};
    const Keypad[] _right =  {_2, _3, _3, _5, _6, _6, _8, _9, _9};
    const Keypad[] _down =   {_4, _5, _6, _7, _8, _9, _7, _8, _9};
    const Keypad[] _left =   {_1, _1, _2, _4, _4, _5, _7, _7, _8};


    public Keypad up() {
        return _up[this];
    }

    public Keypad down() {
        return _down[this];
    }

    public Keypad left() {
        return _left[this];
    }

    public Keypad right() {
        return _right[this];
    }

    public Keypad move(char ch) {
        Keypad result;
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
        return '1' + this;
    }
}

void main(string[] argv) {
    var f = FileStream.open("input.txt", "r");
    assert (f != null);
    string? line;
    var pad = Keypad._5;
    while((line = f.read_line()) != null) {
        foreach(char ch in line.to_utf8()) {
            pad = pad.move(ch);
        }
        stdout.printf("%c", pad.to_char());
    }
    stdout.puts("\nDone!\n");
}

