--- START ---
-- 21/10/2019 Alberto Nale
ALTER TABLE SBI_CROSS_NAVIGATION ADD FROM_DOC_ID INTEGER DEFAULT NULL;
-- Create foreign key between SBI_CROSS_NAVIGATION and SBI_OBJECTS
ALTER TABLE SBI_CROSS_NAVIGATION ADD CONSTRAINT FK_SBI_CROSS_NAVIGATION_1 FOREIGN KEY (FROM_DOC_ID) REFERENCES SBI_OBJECTS(BIOBJ_ID);

ALTER TABLE SBI_CROSS_NAVIGATION ADD TO_DOC_ID INTEGER DEFAULT NULL;
-- Create foreign key between SBI_CROSS_NAVIGATION and SBI_OBJECTS
ALTER TABLE SBI_CROSS_NAVIGATION ADD CONSTRAINT FK_SBI_CROSS_NAVIGATION_2 FOREIGN KEY (TO_DOC_ID) REFERENCES SBI_OBJECTS(BIOBJ_ID);

ALTER TABLE SBI_CROSS_NAVIGATION ADD  POPUP_OPTIONS VARCHAR(4000)  DEFAULT NULL;

-- 14/02/2020 Alberto Nale
ALTER TABLE SBI_MENU ADD ICON VARCHAR2(1000) NULL;
ALTER TABLE SBI_MENU ADD CUST_ICON VARCHAR2(4000) NULL;

--08/06/2020 Andrijana Predojevic
ALTER TABLE SBI_OBJ_PARUSE ADD CONSTRAINT XAK1SBI_OBJ_PARUSE UNIQUE (OBJ_PAR_ID,USE_ID,OBJ_PAR_FATHER_ID,FILTER_OPERATION);

ALTER TABLE SBI_OBJECTS DROP CONSTRAINT XAK1SBI_OBJECTS DROP INDEX;
ALTER TABLE SBI_OBJECTS ADD CONSTRAINT XAK1SBI_OBJECTS UNIQUE (LABEL, NAME, ORGANIZATION);

ALTER TABLE SBI_LOV DROP CONSTRAINT XAK1SBI_LOV DROP INDEX ;
ALTER TABLE SBI_LOV ADD CONSTRAINT XAK1SBI_LOV UNIQUE (LABEL, NAME, ORGANIZATION);

ALTER TABLE SBI_PARAMETERS DROP CONSTRAINT XAK1SBI_PARAMETERS DROPE INDEX;
ALTER TABLE SBI_PARAMETERS ADD CONSTRAINT XAK1SBI_PARAMETERS UNIQUE (LABEL, NAME, ORGANIZATION);