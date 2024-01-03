CREATE TABLE VectorDatabaseTable1 (
    "City Name" VARCHAR(255) PRIMARY KEY,
    VectorizedFeatures FLOAT[],   -- Combined vector representation for all features (Date, Cities, Views)
);
