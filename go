#!/usr/bin/env bash
set -e -o pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" ; pwd -P)

# shellcheck source=./go.variables
source "${SCRIPT_DIR}/go.variables"

goal_install-plugin() {
  mkdir -p ~/.packer.d/plugins
  curl -fsSL https://github.com/vultr/${VULTR_PLUGIN}/releases/download/v${VULTR_PLUGIN_VERSION}/${VULTR_PLUGIN}_${VULTR_PLUGIN_VERSION}_macOs_64-bit.tar.gz -o /tmp/${VULTR_PLUGIN}.tar.gz
  tar -zxvf /tmp/${VULTR_PLUGIN}.tar.gz -C ~/.packer.d/plugins
}

goal_vagrant-natsu() {
  vagrant up natsu-vagrant --provision
}

goal_snapshot-natsu() {
  packer build natsu.pkr.hcl
}

goal_vagrant-erza() {
  vagrant up erza-vagrant --provision
}

goal_snapshot-erza() {
  packer build erza.pkr.hcl
}

validate-args() {
  acceptable_args="$(declare -F | sed -n "s/declare -f goal_//p" | tr '\n' ' ')"

  if [[ -z $1 ]]; then
    echo "usage: $0 <goal>"
    # shellcheck disable=SC2059
    printf "\n$(declare -F | sed -n "s/declare -f goal_/ - /p")"
    exit 1
  fi

  if [[ ! " $acceptable_args " =~ .*\ $1\ .* ]]; then
    echo "Invalid argument: $1"
    # shellcheck disable=SC2059
    printf "\n$(declare -F | sed -n "s/declare -f goal_/ - /p")"
    exit 1
  fi
}

CMD=${1:-}
shift || true
if validate-args "${CMD}"; then
  "goal_${CMD}"
  exit 0
fi
