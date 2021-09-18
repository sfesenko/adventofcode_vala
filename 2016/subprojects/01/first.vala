/**
 *
 */

using Gee;

[Compact]
enum Direction {

    UP = 0,
    RIGHT,
    DOWN,
    LEFT;

    const Direction[] _right = {RIGHT, DOWN, LEFT, UP};
    const Direction[] _left = {LEFT, UP, RIGHT, DOWN};

    public Direction right() {
        return _right[this];
    }

    public Direction left() {
        return _left[this];
    }
}

[Compact]
class Spot {

    public int x;
    public int y;

    public Direction d = Direction.UP;

    public Set<string> history = new HashSet<string>();

    public Spot() {
        this.x = 0;
        this.y = 0;
        track_history();
    }

    public string to_string() {
        return @"x = $x, y = $y";
    }

    void track_history() {
        string state = to_string();
        if( state in this.history ) {
            message("Was here!: (%s), distance: %d", state, distance_from_start());
        } else {
            this.history.add(state);
        }
    }

    void move(int length) {
        for(int i = 0; i < length; ++i) {
            one_step_move();
            track_history();
        }
    }

    void one_step_move() {
        switch(d) {
            case Direction.UP:
                ++y;
                break;
            case Direction.RIGHT:
                ++x;
                break;
            case Direction.DOWN:
                --y;
                break;
            case Direction.LEFT:
                --x;
                break;
            default:
                break;
        }
    }

    public int distance_from_start() {
        return x.abs() + y.abs();
    }

    public void command(string cmd) requires(cmd.length > 0) {
        debug("command = %s", cmd);
        char dir;
        int len;
        cmd.scanf("%c%d", out dir, out len);
        switch(dir) {
            case 'R':
                d = d.right();
                break;
            case 'L':
                d = d.left();
                break;
        }
        move(len);
    }
}

void main(string[] argv) {
    string input_file = (argv.length > 1) ? argv[1] : "/dev/stdin";
    debug("input: %s", input_file);
    FileStream f = FileStream.open(input_file, "r");
    if( f == null ) {
        error(@"Cannot open file: \"$input_file\" and fail");
    }
    assert (f != null);
    var sb = new StringBuilder();
    int c;
    var spot = new Spot();
    while((c = f.getc()) > 0) {
        char ch = (char) c;
        if(ch.isspace()) {
            continue;
        }
        if(ch == ',') {
            spot.command(sb.str);
            sb.truncate();
            continue;
        }
        sb.append_c(ch);
    }
    spot.command(sb.str);
    stdout.printf("Spot: (%s), ditance = %d\n", spot.to_string(), spot.distance_from_start());
}

