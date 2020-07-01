#! /usr/bin/env bash

packer validate packer-tdd-infra-example.json
packer build packer-tdd-infra-example.json