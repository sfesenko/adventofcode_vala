using advent2015;

class Day18 : Day {

    bool[,] read_grid (string data, uint size = 100) {
        var lines = data.split ("\n");
        var grid = new bool[lines.length + 1, size + 1];
        for (var i = 0; i < lines.length; ++i) {
            var l = lines[i];
            for (var j = 0; j < l.length; ++j) {
                grid [i, j] = (l[j] == '#');
            }
        }
        return grid;
    }

    uint grid_at (bool[,] grid, int x, int y) {
        if ( 0 <= x < 100 && 0 <= y < 100) {
            return (int) grid [y, x];
        }
        return 0;
    }

    uint count_on (bool[,] grid, int x, int y) {
        uint result =
              grid_at (grid, x-1, y-1)
            + grid_at (grid, x, y-1)
            + grid_at (grid, x+1, y-1)
            + grid_at (grid, x-1, y)
            + grid_at (grid, x+1, y)
            + grid_at (grid, x-1, y+1)
            + grid_at (grid, x, y+1)
            + grid_at (grid, x+1, y+1);
        return result;
    }

    bool[,] next_grid (bool[,] grid) {
        var a = grid.length[0];
        var result = new bool[a,a];
        for (var y = 0; y < a; ++y) {
            for (var x = 0; x < a; ++x) {
                var count = count_on (grid, x, y);
                var b = (grid[y,x] && 1 < count < 4 ) || (!grid[y,x] && count == 3);
                result[y,x] = b;
            }
        }
        return result;
    }

    uint count_lights (bool[,] grid) {
        uint result = 0;
        for (var y = 0; y < 100; ++y) {
            for (var x = 0; x < 100; ++x) {
                result += (uint) grid [y, x];
            }
        }        
        return result;
    }

    uint first_u (string data) {
        var grid = read_grid (data);
        for (var i = 0; i < 100; ++i) {
            grid = next_grid (grid);
        }
        return count_lights (grid);
    }

    uint second_u (string data) {
        var grid = read_grid (data);
        for (var i = 0; i < 100; ++i) {
            grid = next_grid (grid);
            grid[0, 0] = true;
            grid[0, 99] = true;
            grid[99, 0] = true;
            grid[99, 99] = true;
        }
        return count_lights (grid);
    }
}
