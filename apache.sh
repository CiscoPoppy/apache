# apache#!/bin/bash

echo "=== Starting Apache Installation ==="

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install Apache
echo "Installing Apache..."
sudo apt-get install -y apache2

# Start Apache and enable it to start on boot
echo "Starting Apache service..."
sudo systemctl start apache2
sudo systemctl enable apache2

# Create a custom index page
echo "Creating custom index page..."

echo " " > /var/www/html/index.html
cat index.html > /var/www/html/index.html


# Restart Apache
echo "Restarting Apache service..."
sudo systemctl restart apache2


# Verify Nginx is running
echo "Verifying Nginx status..."
if sudo systemctl is-active --quiet apache2; then
  echo "=== SUCCESS: Apache is running! ==="
  echo "You can access it at: http://$(hostname -I | cut -d " " -f1)"
  exit 0
else
  echo "=== ERROR: Apache failed to start ==="
  exit 1
fi
