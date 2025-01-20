#!/bin/bash
set -e

# Store the initialization script
cat > /docker-entrypoint-initdb.d/init-replica.sh << 'EOF'
#!/bin/bash
set -e

until mongosh --eval "print(\"waited for connection\")" > /dev/null 2>&1; do
  sleep 1
done

mongosh --eval "rs.initiate({
  _id: \"rs0\",
  members: [{
    _id: 0,
    host: \"192.168.0.24:27017\"
  }]
})"

echo "MongoDB Replica Set has been initialized."
EOF

# Make the script executable
chmod +x /docker-entrypoint-initdb.d/init-replica.sh

# Start initialization script in background
/docker-entrypoint-initdb.d/init-replica.sh &

# Execute the original docker-entrypoint with mongod
exec docker-entrypoint.sh mongod --bind_ip_all --replSet rs0