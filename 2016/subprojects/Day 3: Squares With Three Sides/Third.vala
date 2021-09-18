
bool is_triangle(int a, int b, int c) {
    bool result = (a + b > c) && (a + c > b) && (b + c > a);
    debug(@"\\/ $a $b $c == $result");
    return result;
}

bool is_line_triangle(string line) {
    int a, b, c;
    line.scanf("%d%d%d", out a, out b, out c);
    return is_triangle(a, b, c);
}

/**
 * 3-1
 */
void read_by_rows() {
    string line;
    int triangles = 0;
    int line_count = 0;
    while((line = stdin.read_line()) != null) {
        ++line_count;
        if(is_line_triangle(line)) {
            ++triangles;
        }
    }
    message("%d triangles found from %d", triangles, line_count);
}

int count_triangles(string[] lines) {
    int a1, b1, c1;
    int a2, b2, c2;
    int a3, b3, c3;

    lines[0].scanf("%d%d%d", out a1, out a2, out a3);
    lines[1].scanf("%d%d%d", out b1, out b2, out b3);
    lines[2].scanf("%d%d%d", out c1, out c2, out c3);

    int count = 0;
    count += (int) is_triangle(a1, b1, c1);
    count += (int) is_triangle(a2, b2, c2);
    count += (int) is_triangle(a3, b3, c3);

    return count;
}

/**
 * 3-2
 */
void read_by_columns() {
    string line;
    int triangles = 0;
    int line_count = 0;
    string[] lines = new string[3];
    while((line = stdin.read_line()) != null) {
        int i = line_count % 3;
        lines[i] = line;
        debug(@"add $line with i=$i");
        ++line_count;
        if(i == 2) {
            triangles += count_triangles(lines);
        }
    }
    message("%d triangles found from %d", triangles, line_count);

}

void main(string[] argv) {
    // read_by_rows();
    read_by_columns();
}

