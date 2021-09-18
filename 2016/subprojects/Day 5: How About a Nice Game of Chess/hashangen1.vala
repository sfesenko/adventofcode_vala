
namespace day5 {

string calculate_hash(string k) {
    int i = 0;
    var pwd = new StringBuilder();
    while(pwd.len < 8) {
        string key = k + i.to_string();
        string key_enc = md5(key);
        if(key_enc.substring(0, 5) == "00000") {
            pwd.append_c(key_enc[5]);
        }
        ++i;
    }
    return pwd.str;
}
void main(string[] argv) {
    assert( md5("abc3231929") == "00000155f8105dff7f56ee10fa9b9abd" );
    string hash = calculate_hash("reyedfim");
    stdout.puts(@"\nCode: $hash\n");
}

}

