CREATE TABLE `Client` (
  `Id` int PRIMARY KEY,
  `First_Name` varchar(255),
  `Last_Name` varchar(255),
  `Email_Address` varchar(255) UNIQUE,
  `Username` varchar(255) UNIQUE,
  `Passw` varchar(255),
  `Raitings` float,
  `Favorite_Sellers` varchar(255),
  `Timestamp` datetime
);

CREATE TABLE `Products` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Description` varchar(255),
  `Photos` varbinary,
  `Price` float,
  `Category` varchar(255),
  `Timestamp` datetime,
  FOREIGN KEY (`Id`) REFERENCES `Buys` (`Product_Id`),
  FOREIGN KEY (`Id`) REFERENCES `Sells` (`Product_Id`),
  FOREIGN KEY (`Id`) REFERENCES `Boosted_Product` (`Prod_Id`)
);

CREATE TABLE `Buyer` (
  `Client_Id` int PRIMARY KEY NOT NULL,
  FOREIGN KEY (`Client_Id`) REFERENCES `Client` (`Id`)
);

CREATE TABLE `Buys` (
  `Product_Id` int,
  `Buyer_Id` int,
  FOREIGN KEY (`Buyer_Id`) REFERENCES `Buyer` (`Client_Id`)
);

CREATE TABLE `Sells` (
  `Product_Id` int,
  `Seller_Id` int,
  FOREIGN KEY (`Seller_Id`) REFERENCES `Seller` (`Client_Id`)
);

CREATE TABLE `Seller` (
  `Client_Id` int PRIMARY KEY NOT NULL,
  FOREIGN KEY (`Client_Id`) REFERENCES `Client` (`Id`)
);

CREATE TABLE `Product_Request` (
  `Id` int PRIMARY KEY,
  `Title` varchar(255),
  `Description` varchar(255),
  `Category` varchar(255),
  `Photos` varbinary,
  `Timestamp` datetime
);

CREATE TABLE `Post` (
  `Buyer_Id` int,
  `Req_Id` int,
  FOREIGN KEY (`Buyer_Id`) REFERENCES `Buyer` (`Client_Id`),
  FOREIGN KEY (`Req_Id`) REFERENCES `Product_Request` (`Id`)
);

CREATE TABLE `Admin` (
  `Client_Id` int PRIMARY KEY NOT NULL,
  `Admin_Id` int UNIQUE,
  `Staff_Icon` varbinary,
  FOREIGN KEY (`Client_Id`) REFERENCES `Client` (`Id`)
);

CREATE TABLE `Boosted_Product` (
  `Prod_Id` int PRIMARY KEY NOT NULL,
  `Boost_Id` int UNIQUE,
  `Rank` int,
  `Timestamp` datetime
);

CREATE TABLE `Send` (
  `Client_Id` int,
  `Msg_Id` int,
  FOREIGN KEY (`Client_Id`) REFERENCES `Client` (`Id`)
);

CREATE TABLE `Recieve` (
  `Client_Id` int,
  `Msg_Id` int,
  FOREIGN KEY (`Client_Id`) REFERENCES `Client` (`Id`)
);

CREATE TABLE `Message` (
  `Id` int PRIMARY KEY,
  `Text` varchar(255),
  `Timestamp` datetime,
  `Reciever_ID` int,
  `Sender_ID` int,
  FOREIGN KEY (`Id`) REFERENCES `Send` (`Msg_Id`),
  FOREIGN KEY (`Id`) REFERENCES `Recieve` (`Msg_Id`),
  FOREIGN KEY (`Reciever_ID`) REFERENCES `Recieve` (`Client_Id`),
  FOREIGN KEY (`Sender_ID`) REFERENCES `Send` (`Client_Id`)
);
