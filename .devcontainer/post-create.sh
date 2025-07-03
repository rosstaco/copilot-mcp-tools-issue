#!/bin/bash

#init git submodules
git submodule update --init --recursive

# Install Trivy plugins
trivy plugin install mcp
