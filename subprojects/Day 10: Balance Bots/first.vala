using Gee;

class Chip {

    public int value;

    public Chip(int value) {
        this.value = value;
    }


    public bool less(Chip c) {
        return this.value < c.value;
    }
}

class Output {

    int index;
    public int val;

    public Output (int index) {
        this.index = index;
    }

   public virtual void accept(Chip c) {
        message("Output %d! chip == %d", index, c.value);
        this.val = c.value;
    }
}

class Bot : Output {
    Output low;
    Output high;

    Chip[] chips = {};

    public Bot(int index) {
        base(index);
    }

    public override void accept(Chip chip) requires (chips.length < 2) {
        chips += chip;
    }

    public bool run() {
        if(chips.length < 2) {
            return false;
        }
        Chip a = chips[0];
        Chip b = chips[1];
        if(a.less(b)) {
            low.accept(a);
            high.accept(b);
        } else {
            low.accept(b);
            high.accept(a);
        }
        chips = {};
        return true;
    }

    public void setLow(Output o) {
        this.low = o;
    }

    public void setHigh(Output o) {
        this.high = o;
    }

    public bool check() {
        if(chips.length < 2 ) {
            return false;
        }
        int a = chips[0].value;
        int b = chips[1].value;

        return int.min(a, b) == 17 && int.max(a, b) == 61;
    }
}

class Factory {
    HashMap<int, Bot> bots = new HashMap<int, Bot>();
    HashMap<int, Output> outputs = new HashMap<int, Output>();

    public void accept(string line) {
        if(line.has_prefix("value")) {
            int v, b;
            line.scanf("value %d goes to bot %d", out v, out b);
            Bot bot = getBot(b);
            Chip c = getChip(v);
            bot.accept(c);
        } else if(line.has_prefix("bot")) {
            int b, hi, low;
            string[] parts = line.split("to");
            parts[0].scanf("bot %d gives low", out b);
            Bot bot = getBot(b);
            Output outHi, outLow;
            if(parts[1].has_prefix(" bot")) {
                parts[1].scanf(" bot %d and high", out low);
                outLow = getBot(low);
            } else {
                parts[1].scanf(" output %d and high", out low);
                outLow = getOutput(low);
            }
            if(parts[2].has_prefix(" bot")) {
                parts[2].scanf(" bot %d", out hi);
                outHi = getBot(hi);
            } else {
                parts[2].scanf(" output %d", out hi);
                outHi = getOutput(hi);
            }
            bot.setHigh(outHi);
            bot.setLow(outLow);
        } else {
            message(@"error: $line");
        }
    }

    Bot getBot(int index) {
        Bot b = bots.get(index);
        if(b == null) {
            b = new Bot(index);
            bots.set(index, b);
        }
        return b;
    }

    Output getOutput(int index) {
        Output o = outputs.get(index);
        if( o == null) {
            o = new Output(index);
            outputs.set(index, o);
        }
        return o;
    }

    Chip getChip(int val) {
        return new Chip(val);
    }

    public void run() {
        bool iterate = false;
        int loop = 0;
        do {
            iterate = false;
            // message(@"Loop $loop");
            foreach( var entry in bots.entries) {
                Bot b = entry.value;
                if(b.check()) {
                    message("! bot %d found ! loop = %d", entry.key, loop);
                }
                var r = b.run();
                iterate = iterate || r;
            }
            ++loop;
        } while(iterate);
        int multiply = outputs.get(0).val * outputs.get(1).val * outputs.get(2).val;
        message(@"Multiply = $multiply");
    }

}

void process_stdin() {
    string line;
    var factory = new Factory();
    while((line = stdin.read_line()) != null) {
        factory.accept(line);
    }
    factory.run();
}

void main() {
    process_stdin();
}
