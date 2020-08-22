using advent2015;

class Day12 : Day {

    uint first_u (string data) {
        uint cs = 0;
        uint result = 0;
        int8 sign = 1;
        for (var i = 0; i < data.length; ++i) {
            var ch = data [i];
            if (ch == '-' && cs == 0) {
                sign = -1;
                continue;
            }
            if (ch.isdigit ()) {
                cs = cs * 10 + (ch - '0');
            } else {
                result += cs * sign;
                cs = 0;
                sign = 1;
            }
        }
        return result;
    }

    int64 count (Variant v) {
        var input = (v.is_of_type (VariantType.VARIANT)) 
            ? v.get_variant () 
            : v;
        var input_type = input.get_type_string ();
        int64 result = 0;
        
        switch (input_type) {
            case "x":
                return input.get_int64 ();
            case "av":
                foreach (var item in input) {
                    result += count (item);
                }
                break;
            case "a{sv}":
                foreach (var item in input) {
                    var child_value = item.get_child_value (1).get_variant ();
                    if (child_value.is_of_type (VariantType.STRING) && child_value.get_string () == "red") {
                        return 0;
                    }
                    result += count (child_value);
                }
                break;
            case "s":
                break;
            default:
                error (@"unhandled type: $input_type");
        }
        return result;
    }

    string second (string data) {
        Variant v;
        try {
            v = Json.gvariant_deserialize_data (data, -1, null);
        } catch (Error e) {
            error (@"$(e.message)");
        }
        return count (v).to_string ();
    }
}
