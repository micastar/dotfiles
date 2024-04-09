#!/usr/bin/sh

set -e

journalctl --vacuum-size=10M

journalctl --vacuum-time=2weeks