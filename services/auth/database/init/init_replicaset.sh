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
    "_id": "repl_auth",
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

echo "****************************************"
echo "Create user ${MONGO_USER} for database $MONGO_DB_NAME"

# Connect to database as admin and create new user
mongosh "mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@${MONGO_URL}:${MONGO_PORT}/?replicaSet=repl_auth&authSource=admin" << EOF
db = db.getSiblingDB('$MONGO_DB_NAME')

db.createUser({
  user:  '$MONGO_USER',
  pwd: '$MONGO_USER_PW',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DB_NAME'
  }]
});

db.getUsers();
EOF

echo "****************************************"
} &


