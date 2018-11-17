workflow "Test Workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker-1"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@6495e70"
  runs = "docker"
  args = "run busybox echo \"$WORDS\""
  env = {
    WORDS = "Hello world"
  }
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@6495e70"
  needs = ["GitHub Action for Docker"]
  runs = "docker"
  args = "run -i /bin/sh -c 'echo $(</dev/stdin)'"
}
