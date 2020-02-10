#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc,char* argv[]) {

    vector<string> args(argv, argv + argc);

//    vector<string> new2_args(args.begin()+2, args.begin() + args.size());

//    string detect_ele = argv[1];

    for (string ele : args) {
        cout << ele << endl;
    }

//    for (auto& ele : new2_args) {
//        cout << ele << endl;
//    }
//
//    cout << detect_ele << endl;
//
//    auto result = find(new2_args.begin(), new2_args.end(), detect_ele);
//
//    if (result == new2_args.end()) {
//        cout << "not found" << endl;
//    }
//    else {
//        cout << "found:" << *result << endl;
//    }
    return 0;
}
