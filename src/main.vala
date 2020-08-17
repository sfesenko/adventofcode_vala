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

int main (string[] args)
{
    var nn = "/home/sfesenko/Projects/AdventOfCode2015/input/day1.txt";
    var input = read_file (nn);

    var result = day_12 (input);
    message (@"size == $(result)");

	return 0;
}
