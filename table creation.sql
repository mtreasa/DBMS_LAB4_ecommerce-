
Create table if not exists `supplier` (`SUPP_ID` INT Primary Key, 
`SUPP_NAME` varchar(50) not null, 
`SUPP_CITY` varchar(50) not null,
`SUPP_PHONE` varchar(10) not null);

Create table if not exists `customer` (`CUS_ID` INT Primary Key, 
`CUS_NAME` varchar(20) not null, 
`CUS_PHONE` varchar(10) not null,
`CUS_CITY` varchar(30) not null,
`CUS_GENDER` char );

Create table if not exists `category` 
(`CAT_ID` INT Primary Key, 
`CAT_NAME` varchar(20) not null);

Create table if not exists `product`
 (`PRO_ID` INT NOT NULL Primary Key, 
`PRO_NAME` varchar(20) not null DEFAULT "Dummy Product", 
`PRO_DESC` varchar(60) ,
`CAT_ID` INT not null, 
 FOREIGN KEY (`CAT_ID`) REFERENCES category (`CAT_ID`));
 
 Create table if not exists `supplier_pricing`
 (`PRICING_ID` INT NOT NULL Primary Key, 
`PRO_ID` int not null, 
`SUPP_ID` INT not null,
`SUPP_PRICE` INT DEFAULT "0", 
 FOREIGN KEY (`PRO_ID`) REFERENCES product (`PRO_ID`),
 FOREIGN KEY (`SUPP_ID`) REFERENCES supplier (`SUPP_ID`));
 
  Create table if not exists `order`
 (`ORD_ID` INT NOT NULL Primary Key, 
`ORD_AMOUNT` int not null, 
`ORD_DATE` date not null,
`CUS_ID` INT NOT NULL, 
`PRICING_ID` INT NOT NULL, 
 FOREIGN KEY (`CUS_ID`) REFERENCES CUSTOMER (`CUS_ID`),
 FOREIGN KEY (`PRICING_ID`) REFERENCES supplier_pricing (`PRICING_ID`));
 
  Create table if not exists `rating`
 (`RAT_ID` INT NOT NULL Primary Key, 
`ORD_ID` int not null, 
`RAT_RATSTARS` int not null,
 FOREIGN KEY (`ORD_ID`) REFERENCES `ORDER` (`ORD_ID`));
 
 


