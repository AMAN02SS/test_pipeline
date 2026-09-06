#!/bin/bash
set -e

# Update and install NGINX
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y nginx curl

# Get server details for demonstration
HOSTNAME=$(hostname)
PRIVATE_IP=$(hostname -I | awk '{print $1}')

# Create custom landing page to demonstrate load balancing
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Azure Load Balanced NGINX Cluster</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: #f8fafc;
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 2.5rem;
            max-width: 520px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.5), 0 8px 10px -6px rgba(0, 0, 0, 0.5);
            text-align: center;
        }
        .badge {
            display: inline-block;
            background: #10b981;
            color: #064e3b;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            margin-bottom: 1rem;
        }
        h1 {
            font-size: 1.75rem;
            margin: 0 0 1rem 0;
            font-weight: 700;
            color: #38bdf8;
        }
        p {
            color: #94a3b8;
            line-height: 1.5;
            margin-bottom: 1.5rem;
        }
        .info-box {
            background: #0f172a;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 0.75rem;
            text-align: left;
            border-left: 4px solid #38bdf8;
        }
        .info-label {
            font-size: 0.75rem;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .info-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: #f1f5f9;
            font-family: monospace;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="badge">Healthy &bull; Active</div>
        <h1>Azure Load Balanced App</h1>
        <p>Traffic successfully routed by Azure Standard Load Balancer to the backend VM pool.</p>
        
        <div class="info-box">
            <div class="info-label">Serving Hostname</div>
            <div class="info-value">${HOSTNAME}</div>
        </div>

        <div class="info-box">
            <div class="info-label">Internal Private IP</div>
            <div class="info-value">${PRIVATE_IP}</div>
        </div>
    </div>
</body>
</html>
EOF

# Ensure proper permissions and start service
chown -R www-data:www-data /var/www/html
systemctl enable nginx
systemctl restart nginx
