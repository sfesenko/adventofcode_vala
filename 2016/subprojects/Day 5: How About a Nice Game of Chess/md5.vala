
namespace day5 {

string md5(string s) {
    return Checksum.compute_for_string (ChecksumType.MD5, s, s.length);
}


}
