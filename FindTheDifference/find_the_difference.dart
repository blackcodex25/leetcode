/*

-* 389. Find the Difference *-


You are given two strings s and t.

String t is generated by random shuffling string s and then add one more letter at a random position.

Return the letter that was added to t.



Example 1:

Input: s = "abcd", t = "abcde"
Output: "e"
Explanation: 'e' is the letter that was added.
Example 2:

Input: s = "", t = "y"
Output: "y"


Constraints:

0 <= s.length <= 1000
t.length == s.length + 1
s and t consist of lowercase English letters.

*/

import 'dart:collection';

class A {
  String findTheDifference(String s, String t) {
    int n = s.length;
    s.split("").sort();
    t.split("").sort();
    for (int i = 0; i < n; i++) {
      if (s[i] != t[i]) {
        return t[i];
      }
    }
    return s[n];
  }
}

class B {
  String findTheDifference(String s, String t) {
    HashMap<String, int> mp = HashMap();
    for (String c in s.split("")) {
      mp[c] = (mp[c] ?? 0) + 1;
    }
    for (String c in t.split("")) {
      if (((mp[c] ?? 0) - 1) < 0) return c;
    }
    return '\0';
  }
}

class C {
  String findTheDifference(String s, String t) {
    List<int> v = List.filled(26, 0);
    for (String c in s.split("")) v[c.codeUnitAt(0) - 'a'.codeUnitAt(0)] += 1;
    for (String c in t.split(""))
      if (--v[c.codeUnitAt(0) - 'a'.codeUnitAt(0)] < 0) return c;
    return '\0';
  }
}

class D {
  String findTheDifference(String s, String t) {
    int ret = int.parse('\0');
    for (String c in s.split("")) ret ^= int.parse(c);
    for (String c in t.split("")) ret ^= int.parse(c);
    return ret.toString();
  }
}

class E {
  String findTheDifference(String s, String t) {
    int sum = 0;
    for (String c in t.split("")) sum += int.parse(c);
    for (String c in s.split("")) sum -= int.parse(c);
    return sum.toString();
  }
}

class F {
  String findTheDifference(String s, String t) {
    int sum = 0;
    for (String c in t.split("")) {
      (sum += int.parse(c)) % 256;
    }
    for (String c in s.split("")) {
      (sum -= c.indexOf(c)) % 256;
    }
    return sum.toString();
  }
}
