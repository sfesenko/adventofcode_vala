namespace advent2015.Day14 {

    string first (string data) {
        uint[] speed = {};
        uint[] speed_time = {};
        uint[] rest_time = {};
        foreach (var line in data.split ("\n")) {
            var t = line.split (" ");
            speed += uint.parse (t[3]);
            speed_time += uint.parse (t[6]);
            rest_time += uint.parse (t[13]);
        }
        var current_speed = speed.copy ();
        var cycle = speed_time.copy ();
        var distance = new uint[speed.length];

        for (var t = 0; t < 2503; ++t) {
            for (var i = 0; i < speed.length; ++i) {
                distance[i] += current_speed[i];
                cycle[i] -= 1;
                if (cycle[i] == 0) {
                    if (current_speed[i] > 0) {
                        current_speed[i] = 0;
                        cycle[i] = rest_time[i];
                    } else {
                        current_speed[i] = speed[i];
                        cycle[i] = speed_time[i];
                    }
                }
            }
        }
        uint res = 0;
        foreach (var d in distance) {
            if (d > res) {
                res = d;
            }
        }
        return res.to_string ();
    }

    string second (string data) {
        uint[] speed = {};
        uint[] speed_time = {};
        uint[] rest_time = {};
        foreach (var line in data.split ("\n")) {
            var t = line.split (" ");
            speed += uint.parse (t[3]);
            speed_time += uint.parse (t[6]);
            rest_time += uint.parse (t[13]);
        }
        var current_speed = speed.copy ();
        var cycle = speed_time.copy ();
        var distance = new uint[speed.length];
        
        var points = new uint[speed.length];

        for (var t = 0; t < 2503; ++t) {
            uint max_distance = 0;
            uint[] award_points = {};
            for (var i = 0; i < speed.length; ++i) {
                distance[i] += current_speed[i];
                if (distance[i] == max_distance) {
                    award_points += i;
                } else if (distance[i] > max_distance) {
                    max_distance = distance[i];
                    award_points = { i };
                }
                cycle[i] -= 1;
                if (cycle[i] == 0) {
                    if (current_speed[i] > 0) {
                        current_speed[i] = 0;
                        cycle[i] = rest_time[i];
                    } else {
                        current_speed[i] = speed[i];
                        cycle[i] = speed_time[i];
                    }
                }
            }
            foreach (var pi in award_points) {
                points[pi] += 1;
            }
        }
        uint res = 0;
        foreach (var d in points) {
            if (d > res) {
                res = d;
            }
        }
        return res.to_string ();
    }
}
