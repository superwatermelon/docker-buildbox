#!/usr/bin/env bats

@test "awscli is installed" {
  run docker run --rm "$IMAGE" aws --version
  [ "$status" -eq 0 ]
}

@test "terraform is installed" {
  run docker run --rm "$IMAGE" /bin/sh -c 'terraform --version | head -n 1 | grep "0.11.1"'
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

@test "docker is installed at latest version" {
  run docker run --rm "$IMAGE" /bin/sh -c 'docker version | grep -E "Version:\s+17\."'
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
  run docker run --rm "$IMAGE" /bin/sh -c '[[ -f /usr/lib/libsass.so.0 ]]'
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

@test ".aws directory exists" {
  run docker run --rm "$IMAGE" /bin/sh -c '[[ -d ~/.aws ]]'
  [ "$status" -eq 0 ]
}

@test ".aws directory owned by buildbox user" {
  run docker run --rm "$IMAGE" /bin/sh -c 'stat -c "%U %G" ~/.aws'
  [ "$output" == "buildbox buildbox" ]
}

@test "buildbox-assume-role command is available" {
  run docker run --rm "$IMAGE" /bin/sh -c '[[ -x "$(command -v buildbox-assume-role)" ]]'
  [ "$status" -eq 0 ]
}

@test "buildbox-ecr-login command is available" {
  run docker run --rm "$IMAGE" /bin/sh -c '[[ -x "$(command -v buildbox-ecr-login)" ]]'
  [ "$status" -eq 0 ]
}

@test "buildbox-ecr-docker-push command is available" {
  run docker run --rm "$IMAGE" /bin/sh -c '[[ -x "$(command -v buildbox-ecr-docker-push)" ]]'
  [ "$status" -eq 0 ]
}
