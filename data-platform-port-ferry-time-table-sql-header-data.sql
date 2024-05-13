CREATE TABLE `data_platform_port_ferry_time_table_header_data`
(
  `Port`                         int(16) NOT NULL,
  `FerryLine`                    int(16) NOT NULL,
  `TimeTableVersion`             int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `PortFerryTimeTableID`         int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingTime`                 time(16) NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Port`, `FerryLine`, `TimeTableVersion`, `WeekdayType`, `PortFerryTimeTableID`, `ExpressType`),

    CONSTRAINT `DPFMPortFerryTimeTableHeaderData_fk` FOREIGN KEY (`Port`, `FerryLine`) REFERENCES `data_platform_port_ferry_line_data` (`Port`, `FerryLine`),
    CONSTRAINT `DPFMPortFerryTimeTableHeaderDataWeekdayType_fk` FOREIGN KEY (`FerryLine`, `WeekdayType`) REFERENCES `data_platform_ferry_line_weekday_type_data` (`FerryLine`, `WeekdayType`),
    CONSTRAINT `DPFMPortFerryTimeTableHeaderDataExpressType_fk` FOREIGN KEY (`FerryLine`, `ExpressType`) REFERENCES `data_platform_ferry_line_express_type_data` (`FerryLine`, `ExpressType`),
    CONSTRAINT `DPFMPortFerryTimeTableHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMPortFerryTimeTableHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
