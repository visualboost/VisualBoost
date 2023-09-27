mongosh << EOF

db = db.getSiblingDB('$MONGO_DB_NAME')

db.createUser({
  user:  '$MONGO_USER',
  pwd: '$MONGO_USER_PW',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DB_NAME'
  }]
})

EOF
