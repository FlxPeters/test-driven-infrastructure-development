from http.server import HTTPServer, BaseHTTPRequestHandler


class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello, DevCon!")


print("Start server at port 0.0.0.0:8000")
httpd = HTTPServer(("0.0.0.0", 8000), SimpleHTTPRequestHandler)
httpd.serve_forever()
