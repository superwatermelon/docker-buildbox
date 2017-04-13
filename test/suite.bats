#!/usr/bin/env bats

@test "awscli is installed" {
  run docker run --rm "$IMAGE" aws --version
  [ "$status" -eq 0 ]
}

@test "terraform is installed" {
  run docker run --rm "$IMAGE" terraform --version
  [ "$status" -eq 0 ]
}

@test "virtualenv is installed" {
  run docker run --rm "$IMAGE" virtualenv --version
  [ "$status" -eq 0 ]
}

@test "make is installed" {
  run docker run --rm "$IMAGE" make --version
  [ "$status" -eq 0 ]
}

@test "run as buildbox" {
  run docker run --rm "$IMAGE" whoami
  [ "$output" == "buildbox" ]
}