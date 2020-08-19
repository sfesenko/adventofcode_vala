using advent2015;

class Day7 : Day {

    bool get_value(HashTable<string, ushort> wires, string label, out ushort result) {
        uint a;
        if (uint.try_parse (label, out a)) {
            result = (ushort) a;
            return true;
        }
        if (wires.contains (label)) {
            result = wires [label];
            return true;
        }
        result = 0; // suppress compiler warning
        return false;
    }

    bool evaluate (HashTable<string, ushort> wires, string instruction, out string wire_name, out ushort result) {
        var tokens = instruction.split (" ");
        wire_name = tokens [tokens.length - 1];
        if (tokens[1] == "->") {
            ushort a;
            if (get_value (wires, tokens[0], out a)) {
                result = a;
                return true;
            }
        } else if (tokens[0] == "NOT") {
            ushort a;
            if (get_value (wires, tokens[1], out a)) {
                result = ~a;
                return true;
            }
        } else if (tokens[1] == "AND") {
            ushort a;
            ushort b = 0;
            if (get_value (wires, tokens[0], out a) && get_value (wires, tokens[2], out b)) {
                result = a & b;
                return true;
            }
        } else if (tokens[1] == "OR") {
            ushort a;
            ushort b = 0;
            if (get_value (wires, tokens[0], out a) && get_value (wires, tokens[2], out b)) {
                result = a | b;
                return true;
            }
        } else if (tokens[1] == "RSHIFT") {
            ushort a;
            ushort b = 0;
            if (get_value (wires, tokens[0], out a) && get_value (wires, tokens[2], out b)) {
                result = a >> b;
                return true;
            }
        } else if (tokens[1] == "LSHIFT") {
            ushort a;
            ushort b = 0;
            if (get_value (wires, tokens[0], out a) && get_value (wires, tokens[2], out b)) {
                result = a << b;
                return true;
            }
        }
        result = 0; // suppress compiler warning
        return false;
    }

    uint first (string data) {
        var instructions = new GenericSet<string> (str_hash, str_equal);
        foreach (var l in data.split ("\n")) {
            if (l.length > 0) {
                instructions.add (l);
            }
        }
        var wires = new HashTable<string, ushort> (str_hash, str_equal);
        while (instructions.length > 0) {
            var size = instructions.length;
            foreach (var inst in instructions.get_values ()) {
                ushort w;
                string wire;
                if(evaluate (wires, inst, out wire, out w)) {
                    wires.@set (wire, w);
                    instructions.remove (inst);
                }
            }
            if (size == instructions.length) {
                instructions.@foreach ((s) => {
                    warning (@"Unprocessed: $s");
                });
                error (@"Logic is wrong");
            }
        }

//        wires.@foreach ((k, v) => {
//            debug (@"'$k' ==> $v");
//        });
        return wires ["a"];
    }

    uint second (string data) {
        var a = first (data);
        var ln = data.split ("\n");
        for (var i = 0; i < ln.length; ++i) {
            if (ln[i].has_suffix ("-> b")) {
                ln[i] = @"$a -> b";
                break;
            }
        }
        var data2 = string.joinv ("\n", ln);
        return first (data2);
    }
}

