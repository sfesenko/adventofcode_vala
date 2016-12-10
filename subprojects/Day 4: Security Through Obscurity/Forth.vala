
using Gee;

namespace abc {

string get_hash(string s) {
    var stats = new HashMap<char, int>();
    foreach(var ch in s.to_utf8())  {
        if(!ch.isalpha()) {
            continue;
        }
        stats[ch] = stats[ch] + 1;
    }
    var pq = new Gee.ArrayList<char>();
    pq.add_all(stats.keys);
    pq.sort(
        (a, b) => {
            int result = stats[b] - stats[a];
            if(result == 0) {
                result = a - b;
            }
            return result;
        }
    );
    return (string) pq.slice(0, 5).to_array();
}

int get_sector(string s) {
    int nameEnd = s.last_index_of_char('-');
    string name = s.substring(0, nameEnd);
    int hash_start = s.last_index_of_char('[');
    string original_hash = s.slice(hash_start + 1, s.length - 1);

    string calculated_hash = get_hash(name);
    int sector_value = 0;
    if(original_hash == calculated_hash) {
        string sector = s.slice(nameEnd + 1, hash_start);
        sector_value = int.parse(sector);
    }
    message(@"name = $name, original_hash = $original_hash, hash = $calculated_hash, value = $sector_value");
    return sector_value;
}

void process_stdin() {
    string s;
    int sector_sum = 0;
    while((s = stdin.read_line()) != null) {
        sector_sum += get_sector(s);
    }
    message(@"real room sector's summ === $sector_sum");

}

void main(string[] argv) {
    assert( get_sector("not-a-real-room-404[oarel]") == 404 );
    process_stdin();
}

}
