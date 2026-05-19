#!/usr/bin/env python3
import functools
import http.server
import socketserver
import tempfile
import urllib.request
from pathlib import Path

START_PORT = 8767
INDEX_URL = "https://raw.githubusercontent.com/tuannvm/clashboard/main/index.html"

root = Path(tempfile.mkdtemp(prefix="clashboard-"))
index = root / "index.html"

print("Downloading Clashboard...")
urllib.request.urlretrieve(INDEX_URL, index)


def create_server(handler):
    for port in range(START_PORT, START_PORT + 20):
        try:
            server = socketserver.TCPServer(("127.0.0.1", port), handler)
            return server, port
        except OSError as error:
            if error.errno not in (48, 98, 10048):
                raise
    raise RuntimeError(f"No open local port found from {START_PORT} to {START_PORT + 19}")


handler = functools.partial(http.server.SimpleHTTPRequestHandler, directory=str(root))
server, port = create_server(handler)
with server:
    url = f"http://127.0.0.1:{port}/"
    print(f"Serving Clashboard at {url}")
    print("Open that URL in your browser.")
    print("Press Control-C to stop.")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nStopped.")

