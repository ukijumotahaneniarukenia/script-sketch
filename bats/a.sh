#!/usr/bin/env bats

setup() {
  load ./bats-assert/load
  load ./bats-support/load

  test_file="./test.txt"
  touch "$test_file"
}

teardown() {
  rm -f "$test_file"
}

@test 'fail()' {
  fail 'this test always fails'
}

@test 'fail() with pipe' {
  echo 'this test always fails' | fail
}
@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  assert_equal "$result" 4
}

@test "addition using bc (fail)" {
  result="$(echo 2+1 | bc)"
  assert_equal "$result" 4
}

@test 'assert_equal()' {
  assert_equal 'have' 'want'
}

@test 'assert_equal()' {
  assert_equal 'うんこ' 'うんこ'
}

@test "check file" {
  assert [ -f "$test_file" ]
}

@test "skip test" {
  skip
  refute [ -f "$test_file" ]
}

@test "normal command" {
  ls
  assert_success
}
