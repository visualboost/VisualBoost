#!/bin/bash

{
while ! mongosh --host ${MONGO_URL} --port ${MONGO_PORT}
do
    echo "Waiting for startup.. ${MONGO_URL}:${MONGO_PORT}"
    sleep 1
done

echo "Connected to ${MONGO_URL}:${MONGO_PORT}"
echo "****************************************"
echo "Init replicaset"

#Init replicaset
mongosh --host ${MONGO_URL} --port ${MONGO_PORT} --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin<< EOF
var cfg = {
    "_id": "repl_main",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "${MONGO_URL}:${MONGO_PORT}",
            "priority": 1
        }
    ]
};

rs.initiate(cfg, { force: true });
rs.reconfig(cfg, { force: true });
rs.status();
EOF

echo "****************************************"
echo "Successfully initialized replicaset"
} &


