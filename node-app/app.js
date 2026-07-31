const http = require('http');
const port = process.env.PORT || 3000;

const html = `<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PM2 Frontend App</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #0f172a, #2563eb);
        color: #fff;
        min-height: 100vh;
        display: grid;
        place-items: center;
      }
      .card {
        background: rgba(255,255,255,0.14);
        border: 1px solid rgba(255,255,255,0.2);
        padding: 2rem 2.5rem;
        border-radius: 16px;
        box-shadow: 0 20px 45px rgba(0,0,0,0.2);
        text-align: center;
      }
      h1 { margin-bottom: 0.5rem; }
      p { margin-top: 0; opacity: 0.9; }
    </style>
  </head>
  <body>
    <div class="card">
      <h1>Welcome to your PM2 deployment</h1>
      <p>This is a simple frontend app running from Node.js.</p>
    </div>
  </body>
</html>`;

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', service: 'node-pm2-frontend' }));
    return;
  }

  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.end(html);
});

server.listen(port, () => {
  console.log(`Frontend app listening on port ${port}`);
});
