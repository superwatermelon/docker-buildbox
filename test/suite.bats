#!/usr/bin/env bats

@test "awscli is installed" {
  run docker run --rm "$IMAGE" aws --version
  [ "$status" -eq 0 ]
}

@test "terraform is installed" {
  run docker run --rm "$IMAGE" /bin/sh -c 'terraform --version | head -n 1 | grep "0.10.7"'
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

@test "bash is installed" {
  run docker run --rm "$IMAGE" bash --version
  [ "$status" -eq 0 ]
}

@test "ca-certificates are installed" {
  run docker run --rm "$IMAGE" find /etc/ssl -name "*.crt"
  [ "$status" -eq 0 ]
}

@test "docker is installed at stable version" {
  run docker run --rm "$IMAGE" /bin/sh -c 'docker --version | grep "1.12.6"'
  [ "$status" -eq 0 ]
}

@test "node is installed" {
  run docker run --rm "$IMAGE" node --version
  [ "$status" -eq 0 ]
}

@test "npm is installed" {
  run docker run --rm "$IMAGE" npm --version
  [ "$status" -eq 0 ]
}

@test "jq is installed" {
  run docker run --rm "$IMAGE" jq --version
  [ "$status" -eq 0 ]
}

@test "bats is installed" {
  run docker run --rm "$IMAGE" bats --version
  [ "$status" -eq 0 ]
}

@test "libsass is installed" {
  run docker run --rm "$IMAGE" [[ -f /usr/lib/libsass.so.0 ]]
  [ "$status" -eq 0 ]
}

@test "git is installed" {
  run docker run --rm "$IMAGE" git --version
  [ "$status" -eq 0 ]
}

@test "run as buildbox" {
  run docker run --rm "$IMAGE" whoami
  [ "$output" == "buildbox" ]
}
