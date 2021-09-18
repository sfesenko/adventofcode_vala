
namespace day6 {

class Freuencer {

	const int ARRAY_LENGTH = 8;
	const int ALPHABET_LENGTH = 26;

	char[,] stats = new char[ARRAY_LENGTH, ALPHABET_LENGTH];

	public Freuencer() {
	}

	public void offer(string s) requires(s.length == ARRAY_LENGTH) {
		char[] array = s.to_utf8();
		for(int i = 0; i < array.length; ++i) {
			int c_idx = array[i] - 'a';
			stats[i, c_idx] = stats[i, c_idx] + 1;
//			message(@"i = $i, c_idx = $c_idx, stat = %d", stats[i, c_idx]);
		}
	}

	public string get_text() {
		var text_array = new char[ARRAY_LENGTH];
		for(int i = 0; i < ARRAY_LENGTH; ++i) {
			char min_rank = 99;
			char max_position = 0;
			for(char j = 0; j < ALPHABET_LENGTH; ++j) {
				char rank = stats[i, j];
				if(rank == 0) {
					continue;
				}
				if(rank < min_rank) {
					max_position = j;
					min_rank = rank;
				}
			}
			text_array[i] = 'a' + max_position;
		}
		return (string) text_array;
	}
}

void main(string[] argv) {
	var f = new Freuencer();
	string line;
	while((line = stdin.read_line()) != null) {
		f.offer(line);
	}
	stdout.puts(f.get_text());
}

}

