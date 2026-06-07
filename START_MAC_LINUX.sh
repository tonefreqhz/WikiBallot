#!/bin/bash
# DoughForge Dongle — Mac/Linux launcher
cd "$(dirname "$0")"
echo ""
echo "  DoughForge -- The Great Withholding"
echo "  Starting local server..."
echo ""
python3 tools/serve_local.py
