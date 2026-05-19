#!/usr/bin/env python3
import functools
import http.server
import socketserver
import tempfile
import urllib.request
import webbrowser
from pathlib import Path

PORT = 8767
INDEX_URL = "https://raw.githubusercontent.com/tuannvm/clashboard/main/index.html"

root = Path(tempfile.mkdtemp(prefix="clashboard-"))
index = root / "index.html"

print("Downloading Clashboard...")
urllib.request.urlretrieve(INDEX_URL, index)

handler = functools.partial(http.server.SimpleHTTPRequestHandler, directory=str(root))
with socketserver.TCPServer(("127.0.0.1", PORT), handler) as server:
    url = f"http://127.0.0.1:{PORT}/"
    print(f"Serving Clashboard at {url}")
    print("Press Control-C to stop.")
    webbrowser.open(url)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nStopped.")

