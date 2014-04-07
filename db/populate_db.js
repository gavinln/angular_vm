conn = new Mongo();
db = conn.getDB("nodetest1");

db.usercollection.insert(
    { "username" : "testuser1", "email" : "testuser1@testdomain.com" }
);

newstuff = { "username" : "testuser2", "email" : "testuser2@testdomain.com" };
db.usercollection.insert(newstuff);

newstuff = { "username" : "testuser3", "email" : "testuser3@testdomain.com" };
db.usercollection.insert(newstuff);
