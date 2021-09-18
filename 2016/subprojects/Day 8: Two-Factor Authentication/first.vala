
namespace day8 {

class LCD : Object {

    int width;
    int height;

    bool[,] screeen;

    public LCD (int x = 50, int y = 6) {
        this.width = x;
        this.height = y;
        this.screeen = new bool[width, height];
    }

    public void rect(int x, int y) requires(x < width) requires(y < height){
        for(int i = 0; i < y; ++i) {
            for(int j = 0; j < x; ++j) {
                screeen[j, i] = true;
            }
        }
    }

    public void rotate_row(int y, int count) requires(y < height){
        for(int i = 0; i < count; ++i) {
            bool last = screeen[width - 1, y];
            for(int j = width - 1; j > 0; --j) {
                screeen[j, y] = screeen[j - 1, y];
            }
            screeen[0, y] = last;
        }
    }

    public void rotate_column(int x, int count) requires(x < width){
        for(int i = 0; i < count; ++i) {
            bool last = screeen[x, height - 1];
            for(int j = height - 1; j > 0; --j) {
                screeen[x, j] = screeen[x, j - 1];
            }
            screeen[x, 0] = last;
        }
    }

    public void draw() {
        for(int i = 0; i < height; ++i) {
            for(int j = 0; j < width; ++j) {
                char p = (screeen[j, i]) ? '#' : '.';
                stdout.putc(p);
            }
            stdout.putc('\n');
        }
    }

    public int count_pixels() {
        int result = 0;
        for(int x = 0; x < width; ++x) {
            for(int y = 0; y < height; ++y) {
                result += (int) screeen[x, y];
            }
        }
        return result;
    }

    public void apply_command(string command) {
        int a, b;
        if("rotate row" in command) {
            command.scanf("rotate row y=%d by %d", out a, out b);
            rotate_row(a, b);
        } else if("rotate column" in command) {
            command.scanf("rotate column x=%d by %d", out a, out b);
            rotate_column(a, b);
        } else if("rect" in command) {
            command.scanf("rect %dx%d", out a, out b);
            rect(a, b);
        } else {
            assert(false);
        }
    }
}

void process_stdin() {
    string line;
    var lcd = new LCD();
    while((line = stdin.read_line()) != null) {
        lcd.apply_command(line);
    }
    lcd.draw();
    stdout.printf("Pixels == %d\n", lcd.count_pixels());
}

void main(string[] argv) {
    var s = new LCD(7, 3);
    s.apply_command("rect 3x2");
    s.apply_command("rotate column x=1 by 1");
    s.apply_command("rotate row y=0 by 4");
    s.apply_command("rotate column x=1 by 1");
    s.draw();
    process_stdin();
}

}

