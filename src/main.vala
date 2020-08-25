/* main.vala
 *
 * Copyright 2020 Sergii Fesenko
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using advent2015;

/*
void run (RunFunc d1, RunFunc d2, string data) {
    var result1 = d1 (data);
    message (@"Result1: $result1");
    var result2 = d2 (data);
    message (@"Result2: $result2");
}
*/

delegate string StringProvider ();
void select_day (uint day_no, out StringProvider first, out StringProvider second) {
    RunFunc d1, d2;
    switch (day_no) {
        case 8:
            var day = new Day8 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 9:
            var day = new Day9 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 10:
            var day = new Day10 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 11:
            var day = new Day11 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 12:
            var day = new Day12 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 13:
            var day = new Day13 ();
            d1 = day.first;
            d2 = day.second;
            break;
        case 14:
            d1 = Day14.first;
            d2 = Day14.second;
            break;
        case 15:
            var day = new Day15 ();
            d1 = day.first;
            d2 = day.second;
            break;
        default:
            d1 = (_) => "not implemented ;-(";
            d2 = (_) => "not implemented ;-(";
            break;
    }
    var base_path = "/home/sfesenko/Projects/AdventOfCode2015/input/";
    var file_name = (false) ? "test.txt" : @"day$(day_no).txt";
    var input_file = base_path + file_name;
    var input = read_file (input_file);
    first = () => d1 (input);
    second = () => d2 (input);
}

void main (string[] args)
{
    StringProvider d1, d2;
    select_day (15, out d1, out d2);

    message (@"Result1: $(d1 ())");
    message (@"Result2: $(d2 ())");
}
