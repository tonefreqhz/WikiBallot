#!/usr/bin/env python3
"""
DoughForge Dongle — Offline Local Server
Serves the site at http://localhost:8080
Opens browser automatically.
No internet required. No dependencies beyond Python 3.
"""

import http.server
import socketserver
import os
import threading
import webbrowser
import sys

PORT = 8080
# Serve from public/ directory relative to this script
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SERVE_DIR  = os.path.join(SCRIPT_DIR, '..', 'public')

if not os.path.isdir(SERVE_DIR):
    # Fallback: serve from same directory as script
    SERVE_DIR = SCRIPT_DIR
    print(f"Warning: public/ not found, serving from {SERVE_DIR}")

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=SERVE_DIR, **kwargs)

    def log_message(self, fmt, *args):
        pass  # Suppress access log noise

def open_browser():
    import time
    time.sleep(0.8)
    webbrowser.open(f'http://localhost:{PORT}')

if __name__ == '__main__':
    threading.Thread(target=open_browser, daemon=True).start()
    try:
        with socketserver.TCPServer(('', PORT), Handler) as httpd:
            print(f'\n  DoughForge Dongle')
            print(f'  Running at http://localhost:{PORT}')
            print(f'  Serving: {os.path.abspath(SERVE_DIR)}')
            print(f'\n  Press Ctrl+C to stop.\n')
            httpd.serve_forever()
    except OSError as e:
        if 'Address already in use' in str(e):
            print(f'\n  Port {PORT} in use. Try: http://localhost:{PORT}')
            webbrowser.open(f'http://localhost:{PORT}')
        else:
            raise
    except KeyboardInterrupt:
        print('\n  Server stopped.')
