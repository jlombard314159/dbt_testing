CREATE TABLE IF NOT EXISTS 'ParentData' (
    'respondent_id' INTEGER NOT NULL UNIQUE,
    'contact_info' TEXT NOT NULL,
    'survey_type' TEXT NOT NULL,
    PRIMARY KEY ('respondent_id')
);

CREATE INDEX 'ix_ParentData_respondent' ON 'ParentData' ('respondent_id');

CREATE TABLE IF NOT EXISTS 'SurveyData' (
    'respondent_id' INTEGER NOT NULL UNIQUE,
    'year_id' INTEGER NOT NULL,
    'measurement' TEXT NOT NULL,
    'value' REAL NOT NULL,
    PRIMARY KEY ('respondent_id', 'year_id')
    FOREIGN KEY ('respondent_id') REFERENCES 'ParentData' ('respondent_id')
);

CREATE INDEX 'ix_SurveyData_respondent_yearid' ON 'SurveyData' ('respondent_id', 'year_id');

CREATE TABLE IF NOT EXISTS 'GeographicData' (
   'respondent_id' INTEGER NOT NULL UNIQUE,
   'spatial_id' TEXT NOT NULL,
   'x_coord' FLOAT NOT NULL,
   'y_coord' FLOAT NOT NULL,
   'spatial_proj' TEXT NOT NULL,
    PRIMARY KEY ('respondent_id', 'spatial_id')
    FOREIGN KEY ('respondent_id') REFERENCES 'ParentData' ('respondent_id')
);
CREATE INDEX 'ix_GeographicData_respondent_spatialid' ON 'GeographicData' ('respondent_id', 'spatial_id');