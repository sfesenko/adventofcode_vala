
namespace day5 {

string calculate_hash2(string k) {
    char[] password = "________".to_utf8();
    string password_s = (string) password;
    int ready_chars = 0;
    int i = 0;
    while(ready_chars < 8) {
        string key = k + i.to_string();
        string key_enc = md5(key);
        if(key_enc.substring(0, 5) == "00000")  {
            char idx = key_enc[5] - '0';
            if(idx < 8 && password[idx] == '_') {
                password[idx] = key_enc[6];
                password_s = (string) password;
                stdout.printf("\r(%d) !Code: %10s, i=%10d", ready_chars, password_s, i);
                ++ready_chars;
                continue;
            }
        }
        ++i;
        if(i % 100000 == 0) {
            password_s = (string) password;
            stdout.printf("\r(%d) !Code: %10s, i=%10d", ready_chars, password_s, i);
        }
    }
    return password_s;
}

void main(string[] argv) {
    assert( md5("abc3231929") == "00000155f8105dff7f56ee10fa9b9abd" );
    string hash = calculate_hash2("reyedfim");
    stdout.puts(@"\nCode: $hash\n");
}

}

