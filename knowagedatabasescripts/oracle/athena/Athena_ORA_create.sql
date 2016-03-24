-- -----------------------------------
-- knowage Database script
-- Important: Execute this script after creating the SpagoBI Tables
-- ------------------------------------

-- tables for different knowage product types
CREATE TABLE SBI_PRODUCT_TYPE (
	PRODUCT_TYPE_ID 		INTEGER NOT NULL,
	LABEL 					VARCHAR(40) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(PRODUCT_TYPE_ID),
	CONSTRAINT XAK1SBI_PRODUCT_TYPE UNIQUE (LABEL, ORGANIZATION)
);

-- mapping table between organizations (tenants) and product types
CREATE TABLE SBI_ORGANIZATION_PRODUCT_TYPE (
	PRODUCT_TYPE_ID 		INTEGER NOT NULL,
	ORGANIZATION_ID 		INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(PRODUCT_TYPE_ID, ORGANIZATION_ID)
);

-- create: GLOSSARY tables
CREATE TABLE SBI_GL_WORD (
	WORD_ID 				INTEGER NOT NULL,
	WORD 					VARCHAR (100),
	DESCR 					VARCHAR (500),
	FORMULA 				VARCHAR (500),
	STATE 					INTEGER DEFAULT NULL,
	CATEGORY 				INTEGER DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(WORD_ID)
); 

CREATE TABLE SBI_GL_ATTRIBUTES (
	ATTRIBUTE_ID 			INTEGER NOT NULL,
	ATTRIBUTE_CD 			VARCHAR (30),
	ATTRIBUTE_NM 			VARCHAR (100),
	ATTRIBUTE_DS 			VARCHAR (500),
	MANDATORY_FL 			INTEGER,
	ATTRIBUTES_TYPE 		VARCHAR (50),
	DOMAIN 					VARCHAR (500),
	FORMAT 					VARCHAR (30),
	DISPLAY_TP 				VARCHAR (30),
	ATTRIBUTES_ORDER 		VARCHAR (30),
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(ATTRIBUTE_ID) 
); 

CREATE TABLE SBI_GL_WORD_ATTR (
	WORD_ID 				INTEGER NOT NULL,
	ATTRIBUTE_ID 			INTEGER NOT NULL,
	ATTR_VALUE 				VARCHAR (500),
	ATTR_ORDER 				INTEGER,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(WORD_ID,ATTRIBUTE_ID) 
); 

CREATE TABLE SBI_GL_REFERENCES (
	WORD_ID					INTEGER NOT NULL,
	REF_WORD_ID 			INTEGER NOT NULL,
	REFERENCES_ORDER 		INTEGER,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(WORD_ID,REF_WORD_ID) 
); 

CREATE TABLE SBI_GL_GLOSSARY (
	GLOSSARY_ID 			INTEGER NOT NULL,
	GLOSSARY_CD 			VARCHAR (30),
	GLOSSARY_NM 			VARCHAR (100),
	GLOSSARY_DS 			VARCHAR (500),
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(GLOSSARY_ID) 
); 

CREATE TABLE SBI_GL_CONTENTS (
	CONTENT_ID 				INTEGER NOT NULL,
	GLOSSARY_ID 			INTEGER NOT NULL,
	PARENT_ID				INTEGER,
	CONTENT_CD 				VARCHAR (30),
	CONTENT_NM 				VARCHAR (100),
	CONTENT_DS 				VARCHAR (500),
	DEPTH 					INTEGER,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(CONTENT_ID) 
); 


CREATE TABLE SBI_GL_WLIST (
	CONTENT_ID 				INTEGER NOT NULL,
	WORD_ID 				INTEGER NOT NULL,
	WORD_ORDER 				INTEGER,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY(CONTENT_ID,WORD_ID) 
); 

CREATE TABLE SBI_PRODUCT_TYPE_ENGINE (
	PRODUCT_TYPE_ID 		INTEGER NOT NULL,
	ENGINE_ID 				INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (PRODUCT_TYPE_ID, ENGINE_ID)
); 

CREATE TABLE SBI_IMAGES (
	IMAGE_ID 				INTEGER NOT NULL,
	NAME 					VARCHAR(100) NOT NULL,
	CONTENT 				MEDIUMBLOB NOT NULL,
	CONTENT_ICO 			BLOB,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (IMAGE_ID),
	CONSTRAINT NAME_UNIQUE UNIQUE (NAME)
); 


CREATE TABLE SBI_GL_DOCWLIST (
	WORD_ID 				INTEGER NOT NULL,
	BIOBJ_ID 				INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (BIOBJ_ID, WORD_ID)
); 


CREATE TABLE SBI_GL_DATASETWLIST (
	WORD_ID 					INTEGER NOT NULL,
	DS_ID 					INTEGER NOT NULL,
	COLUMN_NAME 				VARCHAR(100) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	 VERSION_NUM INTEGER DEFAULT NULL,
	 PRIMARY KEY (WORD_ID,DS_ID,COLUMN_NAME)
); 

CREATE TABLE SBI_GL_TABLE (
	TABLE_ID 				INTEGER NOT NULL,
	LABEL 					VARCHAR(100) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (TABLE_ID)
); 

CREATE TABLE SBI_GL_BNESS_CLS (
	BC_ID 					INTEGER NOT NULL,
	DATAMART_NAME 			VARCHAR(100) NOT NULL,
	UNIQUE_IDENTIFIER 		VARCHAR(100) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (BC_ID)
); 


CREATE TABLE SBI_GL_BNESS_CLS_WLIST (
	WORD_ID 				INTEGER NOT NULL,
	BC_ID 					INTEGER NOT NULL,
	COLUMN_NAME 			VARCHAR(100) DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (BC_ID,WORD_ID)
);

CREATE TABLE SBI_GL_TABLE_WLIST (
	WORD_ID 				INTEGER NOT NULL,
	TABLE_ID 				INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (TABLE_ID,WORD_ID)
); 

CREATE TABLE SBI_WS_EVENT (
	ID 						INTEGER NOT NULL,
	EVENT_NAME 				VARCHAR(80) NOT NULL,
	IP_COME_FROM 			VARCHAR(15) NULL,
	INCOMING_DATE 			TIMESTAMP NULL,
	TAKE_CHARGE_DATE 		TIMESTAMP NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (id)
	); 

/* CROSS NAVIGATION */
CREATE TABLE SBI_CROSS_NAVIGATION (
	ID 						INTEGER NOT NULL,
	NAME 					VARCHAR(40) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_CROSS_NAVIGATION_PAR (
	ID 						INTEGER NOT NULL,
	CN_ID 					INTEGER NOT NULL,
	FROM_KEY 				INTEGER NOT NULL,
	TO_KEY 					INTEGER NOT NULL,
	FROM_TYPE 				INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

/* OUTPUT PARAMETER*/
CREATE TABLE SBI_OUTPUT_PARAMETER (
	ID 						INTEGER NOT NULL,
	BIOBJ_ID				INTEGER NOT NULL,
	LABEL 					VARCHAR(40) NOT NULL,
	PAR_TYPE_ID 			INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 
	

---- TIMESPAN
CREATE TABLE SBI_TIMESPAN (
	ID 						INTEGER NOT NULL,
	NAME 					VARCHAR(45) NOT NULL,
	TYPE 					VARCHAR(45) NOT NULL,
	CATEGORY 				VARCHAR(45) DEFAULT NULL,
	STATIC_FILTER 			NUMBER(1) DEFAULT 0,
	DEFINITION 				VARCHAR(4000) DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 


CREATE TABLE SBI_ROLES_LAYERS (
	ID_LAYER 				INTEGER NOT NULL,
	ID_ROLE 				INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID_LAYER,ID_ROLE)
); 


-- --------------
-- ALTER TABLE --

-- ADD COLUMN
ALTER TABLE SBI_GEO_LAYERS 		ADD GEO_CATEGORY 			INTEGER 		NULL;
ALTER TABLE SBI_PARUSE 			ADD VALUE_SELECTION 		VARCHAR(20) 	NULL;
ALTER TABLE SBI_PARUSE 			ADD SELECTED_LAYER 			VARCHAR(100) 	NULL;
ALTER TABLE SBI_PARUSE 			ADD SELECTED_LAYER_PROP 	VARCHAR(40) 	NULL;
ALTER TABLE SBI_PARAMETERS 		ADD VALUE_SELECTION 		VARCHAR(20) 	NULL;
ALTER TABLE SBI_PARAMETERS 		ADD SELECTED_LAYER 			VARCHAR(100) 	NULL;
ALTER TABLE SBI_PARAMETERS 		ADD SELECTED_LAYER_PROP 	VARCHAR(40) 	NULL;
ALTER TABLE SBI_USER_FUNC 		ADD PRODUCT_TYPE_ID 		INTEGER NOT 	NULL;
ALTER TABLE SBI_AUTHORIZATIONS	ADD PRODUCT_TYPE_ID 		INTEGER NOT 	NULL;

-- ADD CONSTRAINT
ALTER TABLE SBI_USER_FUNC 					ADD CONSTRAINT FK_PRODUCT_TYPE 					FOREIGN KEY (PRODUCT_TYPE_ID) 	REFERENCES SBI_PRODUCT_TYPE (PRODUCT_TYPE_ID);
ALTER TABLE SBI_ORGANIZATION_PRODUCT_TYPE 	ADD CONSTRAINT FK_PRODUCT_TYPE_1 				FOREIGN KEY (PRODUCT_TYPE_ID) 	REFERENCES SBI_PRODUCT_TYPE (PRODUCT_TYPE_ID);
ALTER TABLE SBI_ORGANIZATION_PRODUCT_TYPE 	ADD CONSTRAINT FK_ORGANIZATION_3 				FOREIGN KEY (ORGANIZATION_ID) 	REFERENCES SBI_ORGANIZATIONS (ID);
ALTER TABLE SBI_AUTHORIZATIONS 				ADD CONSTRAINT FK2_PRODUCT_TYPE 				FOREIGN KEY (PRODUCT_TYPE_ID)	REFERENCES SBI_PRODUCT_TYPE (PRODUCT_TYPE_ID);
ALTER TABLE SBI_GL_WORD 					ADD CONSTRAINT FK_01_SBI_GL_WORD				FOREIGN KEY (CATEGORY) 			REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_GL_WORD 					ADD CONSTRAINT FK_02_SBI_GL_WORD 				FOREIGN KEY (STATE) 			REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_GL_DOCWLIST 				ADD CONSTRAINT FK_01_SBI_GL_DOCWLIST 			FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_DOCWLIST 				ADD CONSTRAINT FK_02_SBI_GL_DOCWLIST 			FOREIGN KEY (BIOBJ_ID) 			REFERENCES SBI_OBJECTS (BIOBJ_ID);
ALTER TABLE SBI_GL_DATASETWLIST 			ADD CONSTRAINT FK_02_SBI_GL_DATASETWLIST 		FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_BNESS_CLS_WLIST 			ADD CONSTRAINT FK_01_SBI_GL_BNESS_CLS_WLIST 	FOREIGN KEY (BC_ID) 			REFERENCES SBI_GL_BNESS_CLS (BC_ID);
ALTER TABLE SBI_GL_BNESS_CLS_WLIST 			ADD CONSTRAINT FK_02_SBI_GL_BNESS_CLS_WLIST 	FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_TABLE_WLIST 				ADD CONSTRAINT FK_01_SBI_GL_TABLE_WLIST 		FOREIGN KEY (TABLE_ID) 			REFERENCES SBI_GL_TABLE (TABLE_ID);
ALTER TABLE SBI_GL_TABLE_WLIST 				ADD CONSTRAINT FK_02_SBI_GL_TABLE_WLIST 		FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_WORD_ATTR 				ADD CONSTRAINT FK_01_GL_WORD_ATTR				FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_WORD_ATTR 				ADD CONSTRAINT FK_02_GL_WORD_ATTR				FOREIGN KEY (ATTRIBUTE_ID) 		REFERENCES SBI_GL_ATTRIBUTES (ATTRIBUTE_ID);
ALTER TABLE SBI_GL_REFERENCES 				ADD CONSTRAINT FK_01_GL_REFERENCES				FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_REFERENCES 				ADD CONSTRAINT FK_02_GL_REFERENCES				FOREIGN KEY (REF_WORD_ID) 		REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_WLIST 					ADD CONSTRAINT FK_01_GL_WLIST					FOREIGN KEY (WORD_ID) 			REFERENCES SBI_GL_WORD (WORD_ID);
ALTER TABLE SBI_GL_WLIST 					ADD CONSTRAINT FK_02_GL_WLIST					FOREIGN KEY (CONTENT_ID) 		REFERENCES SBI_GL_CONTENTS (CONTENT_ID);
ALTER TABLE SBI_GL_CONTENTS 				ADD CONSTRAINT FK_01_GL_CONTENTS				FOREIGN KEY (GLOSSARY_ID) 		REFERENCES SBI_GL_GLOSSARY (GLOSSARY_ID);
ALTER TABLE SBI_GL_CONTENTS 				ADD CONSTRAINT FK_02_GL_CONTENTS				FOREIGN KEY (PARENT_ID) 		REFERENCES SBI_GL_CONTENTS (CONTENT_ID);
ALTER TABLE SBI_PRODUCT_TYPE_ENGINE 		ADD CONSTRAINT FK_PRODUCT_TYPE_2 				FOREIGN KEY (PRODUCT_TYPE_ID) 	REFERENCES SBI_PRODUCT_TYPE (PRODUCT_TYPE_ID);
ALTER TABLE SBI_PRODUCT_TYPE_ENGINE 		ADD CONSTRAINT FK_ENGINE_2 						FOREIGN KEY (ENGINE_ID)			REFERENCES SBI_ENGINES (ENGINE_ID);
ALTER TABLE SBI_OUTPUT_PARAMETER 			ADD CONSTRAINT FK_SBI_OUTPUT_PARAMETER_1 		FOREIGN KEY (BIOBJ_ID) 			REFERENCES SBI_OBJECTS (BIOBJ_ID);
ALTER TABLE SBI_OUTPUT_PARAMETER 			ADD CONSTRAINT FK_SBI_OUTPUT_PARAMETER_2 		FOREIGN KEY (PAR_TYPE_ID) 		REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_CROSS_NAVIGATION_PAR 		ADD CONSTRAINT FK_SBI_CROSS_NAVIGATION_PAR_1 	FOREIGN KEY (CN_ID) 			REFERENCES SBI_CROSS_NAVIGATION (ID);
ALTER TABLE SBI_ROLES_LAYERS 				ADD CONSTRAINT FK_ID_LAYER 						FOREIGN KEY (ID_LAYER) 			REFERENCES SBI_GEO_LAYERS (LAYER_ID) 	ON DELETE CASCADE;
ALTER TABLE SBI_ROLES_LAYERS 				ADD CONSTRAINT FK_ID_ROLE 						FOREIGN KEY (ID_ROLE) 			REFERENCES SBI_EXT_ROLES (EXT_ROLE_ID) 	ON DELETE CASCADE;

-- ADD INDEX
CREATE INDEX IDX_SBI_ORG_PRODUCT_TYPE 		ON SBI_ORGANIZATION_PRODUCT_TYPE (ORGANIZATION_ID);
CREATE INDEX IDX_SBI_GL_WORD_01 			ON SBI_GL_WORD (STATE);
CREATE INDEX IDX_SBI_GL_WORD_02 			ON SBI_GL_WORD (CATEGORY);
CREATE INDEX IDX_SBI_GL_DOCWLIST 			ON SBI_GL_DOCWLIST (WORD_ID ASC);
CREATE INDEX IDX_SBI_GL_DATASETWLIST_01		ON SBI_GL_DATASETWLIST (DS_ID);
CREATE INDEX IDX_SBI_GL_DATASETWLIST_02		ON SBI_GL_DATASETWLIST (ORGANIZATION);
CREATE INDEX IDX_SBI_GL_BNESS_CLS_WLIST 	ON SBI_GL_BNESS_CLS_WLIST (WORD_ID);
CREATE INDEX IDX_SBI_ROLES_LAYERS 			ON SBI_ROLES_LAYERS (ID_ROLE);






-- KPI --
-- KPI --
-- KPI --
-- KPI --
-- KPI --


CREATE TABLE SBI_KPI_ALIAS (
	ID 						INTEGER NOT NULL,
	NAME 					VARCHAR(40) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_KPI_RULE (
	ID 						INTEGER NOT NULL,
	VERSION					INTEGER NOT NULL,
	NAME 					VARCHAR(40) NOT NULL,
	DEFINITION 				VARCHAR(1024) NOT NULL,
	DATASOURCE_ID 			INTEGER NOT NULL, 
	ACTIVE                  CHAR(1) DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID,VERSION)
); 

CREATE TABLE SBI_KPI_KPI (
	ID 						INTEGER NOT NULL,
	VERSION					INTEGER NOT NULL,
	NAME 					VARCHAR(40) NOT NULL,
	DEFINITION 				VARCHAR(1024) NOT NULL,
	CARDINALITY 			VARCHAR(4000) NOT NULL,
	PLACEHOLDER 			VARCHAR(1024) NULL,
	CATEGORY_ID 			INTEGER NULL,
	THRESHOLD_ID 			INTEGER NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID,VERSION)
); 


CREATE TABLE SBI_KPI_PLACEHOLDER (
	ID 						INTEGER NOT NULL,
	NAME 					VARCHAR(40) NOT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_KPI_THRESHOLD (
	ID 						INTEGER NOT NULL,
	NAME 					VARCHAR(40) DEFAULT NULL,
	DESCRIPTION 			VARCHAR(1024),
	TYPE_ID 				INTEGER DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_KPI_THRESHOLD_VALUE (
	ID 						INTEGER NOT NULL,
	THRESHOLD_ID 			INTEGER NOT NULL, 
	POSITION 				INTEGER DEFAULT NULL,
	LABEL 					VARCHAR(40) DEFAULT NULL,
	MIN_VALUE 				DECIMAL(22,0) DEFAULT NULL,
	INCLUDE_MIN 			CHAR (1) DEFAULT NULL,
	MAX_VALUE 				DECIMAL(22,0) DEFAULT NULL,
	INCLUDE_MAX 			CHAR (1) DEFAULT NULL,
	COLOR 					VARCHAR(20) DEFAULT NULL,
	SEVERITY_ID 			INTEGER DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_KPI_RULE_OUTPUT (
	ID 						INTEGER NOT NULL,
	RULE_ID 				INTEGER NOT NULL,
	RULE_VERSION			INTEGER NOT NULL,
	TYPE_ID 				INTEGER NOT NULL,
	ALIAS_ID 				INTEGER NOT NULL,
	CATEGORY_ID 			INTEGER NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100),
	USER_DE 				VARCHAR(100),
	TIME_IN 				TIMESTAMP NOT NULL,
	TIME_UP 				TIMESTAMP,
	TIME_DE 				TIMESTAMP,
	SBI_VERSION_IN 			VARCHAR(10),
	SBI_VERSION_UP 			VARCHAR(10),
	SBI_VERSION_DE 			VARCHAR(10),
	META_VERSION 			VARCHAR(100),
	ORGANIZATION 			VARCHAR(20),
	
	PRIMARY KEY (ID)
); 

CREATE TABLE SBI_KPI_KPI_RULE_OUTPUT (
  KPI_ID 					INTEGER NOT NULL,
  KPI_VERSION 				INTEGER NOT NULL,
  RULE_OUTPUT_ID 			INTEGER NOT NULL,
  PRIMARY KEY (KPI_ID,KPI_VERSION,RULE_OUTPUT_ID)
);

CREATE TABLE SBI_KPI_RULE_PLACEHOLDER (
	RULE_ID 				INTEGER NOT NULL,
	RULE_VERSION			INTEGER NOT NULL,
	PLACEHOLDER_ID 			INTEGER NOT NULL,
	
	PRIMARY KEY (RULE_ID,RULE_VERSION,PLACEHOLDER_ID)
); 

CREATE TABLE SBI_KPI_TARGET (
	TARGET_ID				INTEGER NOT NULL,
	NAME 					VARCHAR(40),
	CATEGORY_ID 			INTEGER NULL,
	START_VALIDITY_DAY		TIMESTAMP NULL DEFAULT NULL,
	END_VALIDITY_DAY		TIMESTAMP NULL DEFAULT NULL,
	
	USER_IN 				VARCHAR(100) NOT NULL,
	USER_UP 				VARCHAR(100) NULL DEFAULT NULL,
	USER_DE 				VARCHAR(100) NULL DEFAULT NULL,
	TIME_IN 				TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	TIME_UP 				TIMESTAMP NULL DEFAULT NULL,
	TIME_DE 				TIMESTAMP NULL DEFAULT NULL,
	SBI_VERSION_IN 			VARCHAR(10) NULL DEFAULT NULL,
	SBI_VERSION_UP 			VARCHAR(10) NULL DEFAULT NULL,
	SBI_VERSION_DE 			VARCHAR(10) NULL DEFAULT NULL,
	META_VERSION 			VARCHAR(100) NULL DEFAULT NULL,
	ORGANIZATION 			VARCHAR(20) NULL DEFAULT NULL,
	
	PRIMARY KEY (TARGET_ID)
) ENGINE=InnoDB ; 

CREATE TABLE SBI_KPI_TARGET_VALUE (
	TARGET_ID			INTEGER NOT NULL,
	KPI_ID 				INTEGER NOT NULL,
	KPI_VERSION			INTEGER NOT NULL,
	TARGET_VALUE		DOUBLE,
	
	USER_IN 			VARCHAR(100) NOT NULL,
	USER_UP 			VARCHAR(100) NULL DEFAULT NULL,
	USER_DE 			VARCHAR(100) NULL DEFAULT NULL,
	TIME_IN 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	TIME_UP 			TIMESTAMP NULL DEFAULT NULL,
	TIME_DE 			TIMESTAMP NULL DEFAULT NULL,
	SBI_VERSION_IN 		VARCHAR(10) NULL DEFAULT NULL,
	SBI_VERSION_UP 		VARCHAR(10) NULL DEFAULT NULL,
	SBI_VERSION_DE 		VARCHAR(10) NULL DEFAULT NULL,
	META_VERSION 		VARCHAR(100) NULL DEFAULT NULL,
	ORGANIZATION 		VARCHAR(20) NULL DEFAULT NULL,
	
	PRIMARY KEY (TARGET_ID,KPI_ID,KPI_VERSION)
) ENGINE=InnoDB ; 

-- ALTER --
ALTER TABLE SBI_KPI_KPI 					ADD CONSTRAINT FK_01_SBI_KPI_KPI 				FOREIGN KEY (CATEGORY_ID) 			REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_KPI_RULE					ADD CONSTRAINT FK_01_SBI_KPI_RULE				FOREIGN KEY (DATASOURCE_ID)			REFERENCES SBI_DATA_SOURCE (DS_ID);
ALTER TABLE SBI_KPI_THRESHOLD 				ADD CONSTRAINT FK_01_SBI_KPI_THRESHOLD 			FOREIGN KEY (TYPE_ID) 				REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_KPI_THRESHOLD_VALUE 		ADD CONSTRAINT FK_01_SBI_KPI_THRESHOLD_VALUE 	FOREIGN KEY (SEVERITY_ID) 			REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_KPI_THRESHOLD_VALUE			ADD CONSTRAINT FK_02_SBI_KPI_THRESHOLD_VALUE	FOREIGN KEY (THRESHOLD_ID)			REFERENCES SBI_KPI_THRESHOLD (ID);
ALTER TABLE SBI_KPI_RULE_OUTPUT 			ADD CONSTRAINT FK_01_SBI_KPI_RULE_OUTPUT 		FOREIGN KEY (TYPE_ID) 				REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_KPI_RULE_OUTPUT 			ADD CONSTRAINT FK_02_SBI_KPI_RULE_OUTPUT 		FOREIGN KEY (RULE_ID,RULE_VERSION) 	REFERENCES SBI_KPI_RULE (ID,VERSION);
ALTER TABLE SBI_KPI_RULE_OUTPUT 			ADD CONSTRAINT FK_03_SBI_KPI_RULE_OUTPUT 		FOREIGN KEY (ALIAS_ID) 				REFERENCES SBI_KPI_ALIAS (ID);
ALTER TABLE SBI_KPI_RULE_OUTPUT 			ADD CONSTRAINT FK_04_SBI_KPI_RULE_OUTPUT 		FOREIGN KEY (CATEGORY_ID) 			REFERENCES SBI_DOMAINS (VALUE_ID);
ALTER TABLE SBI_KPI_RULE_PLACEHOLDER 		ADD CONSTRAINT FK_01_SBI_KPI_RULE_PLACEHOLDER 	FOREIGN KEY (RULE_ID,RULE_VERSION) 	REFERENCES SBI_KPI_RULE (ID,VERSION);
ALTER TABLE SBI_KPI_RULE_PLACEHOLDER 		ADD CONSTRAINT FK_02_SBI_KPI_RULE_PLACEHOLDER 	FOREIGN KEY (PLACEHOLDER_ID) 		REFERENCES SBI_KPI_PLACEHOLDER (ID);
ALTER TABLE SBI_KPI_KPI_RULE_OUTPUT         ADD CONSTRAINT FK_01_SBI_KPI_KPI_RULE_OUTPUT    FOREIGN KEY (KPI_ID,KPI_VERSION)    REFERENCES SBI_KPI_KPI (ID,VERSION);
ALTER TABLE SBI_KPI_KPI_RULE_OUTPUT         ADD CONSTRAINT FK_02_SBI_KPI_KPI_RULE_OUTPUT    FOREIGN KEY (RULE_OUTPUT_ID)        REFERENCES SBI_KPI_RULE_OUTPUT (ID);
ALTER TABLE SBI_KPI_TARGET_VALUE 			ADD CONSTRAINT FK_01_SBI_KPI_TARGET_VALUE 		FOREIGN KEY (TARGET_ID) 			REFERENCES SBI_KPI_TARGET (TARGET_ID);
ALTER TABLE SBI_KPI_TARGET_VALUE 			ADD CONSTRAINT FK_02_SBI_KPI_TARGET_VALUE 		FOREIGN KEY (KPI_ID,KPI_VERSION) 	REFERENCES SBI_KPI_KPI (ID,VERSION);
ALTER TABLE SBI_KPI_TARGET					ADD CONSTRAINT FK_03_SBI_KPI_TARGET 			FOREIGN KEY (CATEGORY_ID) 			REFERENCES SBI_DOMAINS (VALUE_ID);
