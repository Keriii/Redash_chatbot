/*lets create a query that can accpet future youtube datas and store them in the database*/

/*Cities*/

CREATE TABLE IF NOT EXISTS Cities_Chart_data (
    "Date" TEXT,
    "Cities" TEXT,
    "City name" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date")
);

CREATE TABLE IF NOT EXISTS Cities_Table_data (
    "Cities" TEXT,
    "City name" TEXT,
    "Geography" TEXT,
    "Geography.1" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Cities")
);

CREATE TABLE IF NOT EXISTS Cities_Totals(
    "Date" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date")
);

/*Content type*/

CREATE TABLE IF NOT EXISTS Content_type_Chart_data (
    "Date" TEXT,
    "Content type" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Content type")
);

CREATE TABLE IF NOT EXISTS Content_type_Table_data (
    "Content type" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Content type")
);

/*Device type*/

CREATE TABLE IF NOT EXISTS Device_type_Chart_data (
    "Date" TEXT,
    "Device type" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Device type")
);

CREATE TABLE IF NOT EXISTS Device_type_Table_data (
    "Device type" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Device type")
);

/*Geography*/

CREATE TABLE IF NOT EXISTS Geography_Chart_data (
    "Date" TEXT,
    "Geography" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Geography")
);

CREATE TABLE IF NOT EXISTS Geography_Table_data (
    "Geography" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Geography")
);

/*New and returning viewers*/

CREATE TABLE IF NOT EXISTS New_and_returning_viewers_Chart_data(
    "Date" TEXT,
    "New and returning viewers" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "New and returning viewers")
);

CREATE TABLE IF NOT EXISTS New_and_returning_viewers_Table_data(
    "New and returning viewers" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
);

/*Oprating system*/

CREATE TABLE IF NOT EXISTS Operating_system_Chart_data (
    "Date" TEXT,
    "Operating system" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Operating system")
);

CREATE TABLE IF NOT EXISTS Operating_system_Table_data (
    "Operating system" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Operating system")
);

/*Sharing service*/

CREATE TABLE IF NOT EXISTS Sharing_service_Chart_data (
    "Date" TEXT,
    "Sharing service" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Sharing service")
);

CREATE TABLE IF NOT EXISTS Sharing_service_Table_data (
    "Sharing service" TEXT,
    "Shares" INTEGER,
    PRIMARY KEY ("Sharing service")
);

CREATE TABLE IF NOT EXISTS Sharing_service_Totals(
    "Date" TEXT,
    "Shares" INTEGER,
    PRIMARY KEY ("Date")
);

/*Subscription source*/

CREATE TABLE IF NOT EXISTS Subscription_source_Chart_data (
    "Date" TEXT,
    "Subscription source" TEXT,
    "Subscribers" INTEGER,
    PRIMARY KEY ("Date", "Subscription source")
);

CREATE TABLE IF NOT EXISTS Subscription_source_Table_data (
    "Subscription source" TEXT,
    "Views" INTEGER,
    "Subscribers gained" INTEGER,
    "ubscribers lost" INTEGER,
    PRIMARY KEY ("Subscription source")
);

CREATE TABLE IF NOT EXISTS Subscription_source_Totals(
    "Date" TEXT,
    "Subscribers" INTEGER,
    PRIMARY KEY ("Date")
);

/*Subscription status*/

CREATE TABLE IF NOT EXISTS Subscription_status_Chart_data (
    "Date" TEXT,
    "Subscription status" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Subscription status")
);

CREATE TABLE IF NOT EXISTS Subscription_status_Table_data (
    "Subscription status" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" DOUBLE PRECISION,
    PRIMARY KEY ("Subscription status")
);

/*Subtitles and CC*/

CREATE TABLE IF NOT EXISTS Subtitles_and_CC_Chart_data (
    "Date" TEXT,
    "Subtitles and CC" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Subtitles and CC")
);

CREATE TABLE IF NOT EXISTS Subtitles_and_CC_Table_data (
    "Subtitles and CC" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Subtitles and CC")
);

/*Traffic sourse*/

CREATE TABLE IF NOT EXISTS Traffic_sourse_Chart_data (
    "Date" TEXT,
    "Traffic sourse" TEXT,
    "Views" INTEGER,
    PRIMARY KEY ("Date", "Traffic sourse")
);

CREATE TABLE IF NOT EXISTS Traffic_sourse_Table_data (
    "Traffic sourse" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    "Impressions" DOUBLE PRECISION,
    "Impressions click-through rate (%)" DOUBLE PRECISION,
    PRIMARY KEY ("Traffic sourse")
);

/*Viewer age*/

CREATE TABLE IF NOT EXISTS Viewer_age_Table_data (
    "Viewer age" TEXT,
    "Views (%)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    "Average percentage viewed (%)" DOUBLE PRECISION,
    "Watch time (hours) (%)" DOUBLE PRECISION,
    PRIMARY KEY ("Viewer age")
);

/*Viwer gender*/

CREATE TABLE IF NOT EXISTS Viewer_gender_Table_data (
    "Viewer gender" TEXT,
    "Views %" DOUBLE PRECISION,
    "Average view duration" TEXT,
    "Average percentage viewed (%)" DOUBLE PRECISION,
    "Watch time (hours) (%)" DOUBLE PRECISION,
    PRIMARY KEY ("Viewer gender")
);

/*Viwership by date*/

CREATE TABLE IF NOT EXISTS Viwership_by_date_Table_data (
    "Date" TEXT,
    "Views" INTEGER,
    "Watch time (hours)" DOUBLE PRECISION,
    "Average view duration" TEXT,
    PRIMARY KEY ("Date")
);