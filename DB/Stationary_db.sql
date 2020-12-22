CREATE TABLE `stationary`.`customer` (
  `C_ID` INT NOT NULL AUTO_INCREMENT,
  `C_NAME` VARCHAR(255) NULL,
  `C_ADDRESS` VARCHAR(255) NULL,
  `C_EMAILID` VARCHAR(45) NULL,
  `C_DOB` DATETIME NULL,
  PRIMARY KEY (`C_ID`))
COMMENT = '				';

ALTER TABLE `stationary`.`customer` 
ADD COLUMN `C_PHONE1` INT NULL AFTER `C_DOB`;


CREATE TABLE `stationary`.`supplier` (
  `S_ID` INT NOT NULL AUTO_INCREMENT,
  `S_NAME` VARCHAR(255) NULL,
  `S_ADDRESS` VARCHAR(45) NULL,
  `S_PHONE1` INT NULL,
  `S_PHONE2` INT NULL,
  `S_DOB` DATETIME NULL,
  PRIMARY KEY (`S_ID`));

CREATE TABLE `stationary`.`admin` (
  `A_ID` INT NOT NULL AUTO_INCREMENT,
  `A_NAME` VARCHAR(255) NULL,
  `A_PASSWORD` VARCHAR(45) NULL,
  `A_PHONE1` INT NULL,
  PRIMARY KEY (`A_ID`));


CREATE TABLE `stationary`.`inventory` (
  `I_ID` INT NOT NULL,
  `I_BARCODE` VARCHAR(255) NULL,
  `I_NAME` VARCHAR(255) NULL,
  `I_CATEGORY1` VARCHAR(255) NULL,
  `I_CATEGORY2` VARCHAR(255) NULL,
  `I_CATEGORY3` VARCHAR(255) NULL,
  `I_BRAND` VARCHAR(255) NULL,
  `I_QUANTITY` INT NULL,
  `I_PRICE` INT NULL,
  `I_DISCOUNT` INT NULL,
  `I_DOP` DATETIME NULL,
  `I_DOS` DATETIME NULL,
  `I_CGST` INT NULL,
  `I_SGST` INT NULL,
  PRIMARY KEY (`I_ID`),
  CONSTRAINT `S_ID_FK`
    FOREIGN KEY (`I_ID`)
    REFERENCES `stationary`.`supplier` (`S_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


ALTER TABLE `stationary`.`inventory` 
DROP FOREIGN KEY `S_ID_FK`;
ALTER TABLE `stationary`.`inventory` 
CHANGE COLUMN `I_ID` `I_ID` INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE `stationary`.`inventory` 
ADD CONSTRAINT `S_ID_FK`
  FOREIGN KEY (`I_ID`)
  REFERENCES `stationary`.`supplier` (`S_ID`);

ALTER TABLE `stationary`.`inventory` 
ADD COLUMN `I_UPDATEDTIME` DATETIME NULL AFTER `I_SGST`,
ADD COLUMN `I_COMMENTS` VARCHAR(255) NULL AFTER `I_UPDATEDTIME`;



CREATE TABLE `stationary`.`billling` (
  `B_ID` INT NULL,
  `I_NAME_FK` VARCHAR(255) NULL,
  `I_BARCODE_FK` VARCHAR(255) NULL,
  `I_QUANTITY_FK` INT NULL DEFAULT 1,
  `I_PRICE_FK` INT NULL,
  `C_NAME_FK` VARCHAR(255) NULL,
  `C_PHONE1_FK` INT NULL,
  `A_ID` INT NULL,
  `B_DOS` DATETIME NULL,
  `B_TOTALPRICE` INT NULL,
  `B_DISCOUNT` INT NULL,
  `B_SAVED` INT NULL,
  `B_CGST` INT NULL,
  `B_SGST` INT NULL,
  `B_UPDATEDTIME` DATETIME NULL,
  `B_COMMENTS` VARCHAR(255) NULL);

ALTER TABLE `stationary`.`billling` 
ADD COLUMN `P_MODE_FK` VARCHAR(255) NULL AFTER `A_ID`;

ALTER TABLE `stationary`.`billling` 
RENAME TO  `stationary`.`billling_c` ;


CREATE TABLE `stationary`.`payment_option` (
  `P_ID` INT NOT NULL AUTO_INCREMENT,
  `P_MODE` VARCHAR(255) NULL,
  PRIMARY KEY (`P_ID`));


CREATE TABLE `stationary`.`billing_s` (
  `BS_ID` INT NOT NULL,
  `P_MODE_FK` VARCHAR(255) NULL,
  `BS_CREDITCARD_NO` INT NULL,
  `BS_CHEQUE_NO` INT NULL,
  `BS_BANKNAME` VARCHAR(255) NULL,
  `BS_BRANCH_NAME` VARCHAR(255) NULL,
  `BS_DOI` DATETIME NULL,
  `BS_UPDATEDTIME` DATETIME NULL,
  `BS_COMMENTS` VARCHAR(255) NULL,
  PRIMARY KEY (`BS_ID`));
