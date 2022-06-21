CREATE TABLE "SYSTEM"."STORE" 
   (	"STORE_ID" NUMBER(1,0) NOT NULL, 
	"STORE_NAME" VARCHAR2(30 BYTE) NOT NULL, 
	"PRODUCT" VARCHAR2(30 BYTE) NOT NULL, 
	"QUANTITY" NUMBER(2,0) NOT NULL, 
	"COST" NUMBER(10,0) NOT NULL
   );
 
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (1,'Apple Originals 1','iPhone 12 Pro',1,1000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (1,'Apple Originals 1','MacBook pro 13',3,2000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (1,'Apple Originals 1','AirPods Pro',2,280);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (2,'Apple Originals 2','iPhone 12 Pro',2,1000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (3,'Apple Originals 3','iPhone 12 Pro',1,1000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (3,'Apple Originals 3','MacBook pro 13',1,2000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (3,'Apple Originals 3','MacBook Air',4,1100);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (3,'Apple Originals 3','iPhone 12',2,1000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (3,'Apple Originals 3','AirPods Pro',3,280);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (4,'Apple Originals 4','iPhone 12 Pro',2,1000);
Insert into STORE (STORE_ID,STORE_NAME,PRODUCT,QUANTITY,COST) values (4,'Apple Originals 4','MacBook pro 13',1,2500);