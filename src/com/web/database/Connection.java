package com.web.database;

import com.mongodb.ConnectionString;
import com.mongodb.client.MongoClient;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.bson.codecs.configuration.CodecRegistries;
import org.bson.codecs.pojo.PojoCodecProvider;

import static java.util.Objects.isNull;

public class Connection implements AutoCloseable {

    private static final String DB_URL = "mongodb+srv://YankiDb:root@inventorycluster.djuwx.mongodb.net/test";
    private static final String DB_NAME = "YankiDb";

    private static int openedConnectionCount, closeConnectionCount;

    private static MongoClientSettings settings;
    private final MongoClient mongoClient;
    private final MongoDatabase database;

    // clientSettings is for POJO classes registry
    private MongoClientSettings getSettings() {

        if (!isNull(settings))
            return settings;
        //connection url string
        var connectionString = new ConnectionString(DB_URL);

        //configuration for CodecRegistry to include a codec to handle the translation to and from BSON for our POJOs.
        var pojoCodecRegistry = CodecRegistries.fromProviders(PojoCodecProvider.builder().automatic(true).build());
        //default codec registry, which contains all the default codecs for java data types
        var codecRegistry = CodecRegistries.fromRegistries(MongoClientSettings.getDefaultCodecRegistry(),
                pojoCodecRegistry);
        //wrapping all my settings together
        settings = MongoClientSettings.builder()
                .applyConnectionString(connectionString)
                .codecRegistry(codecRegistry)
                .build();
        return settings;
    }

    public Connection() {
        openedConnectionCount++;
        mongoClient = MongoClients.create(getSettings());
        database = mongoClient.getDatabase(DB_NAME);
    }

    public MongoCollection<?> getCollection(String collectionName, Class<?> classname) {
        var coll = database.getCollection(collectionName, classname);
        if (isNull(coll)) database.createCollection(collectionName);
        else return coll;
        return database.getCollection(collectionName, classname);
    }

    public static int getOpenedConnectionCount() {
		return openedConnectionCount;
	}

	public static void setOpenedConnectionCount(int openedConnectionCount) {
		Connection.openedConnectionCount = openedConnectionCount;
	}

	public static int getCloseConnectionCount() {
		return closeConnectionCount;
	}

	public static void setCloseConnectionCount(int closeConnectionCount) {
		Connection.closeConnectionCount = closeConnectionCount;
	}

	@Override
    public void close() {
        if (mongoClient != null) {
            mongoClient.close();
            closeConnectionCount++;
        }
    }

}
