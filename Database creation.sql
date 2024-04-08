
USE boo12;
 
 
DROP TABLE IF EXISTS DrugPrescription;
DROP TABLE IF EXISTS PrescriptionOrders;
DROP TABLE IF EXISTS Drugs;
DROP TABLE IF EXISTS ProductLine;
DROP TABLE IF EXISTS PaymentsInfo;
DROP TABLE IF EXISTS RetailCustomers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Offices;
 
CREATE TABLE Offices (
    OfficeCode VARCHAR(5) NOT NULL,
    City VARCHAR(30),
    Phone_Number VARCHAR(20) NOT NULL,
    AddLine1 VARCHAR(40),
    AddLine2 VARCHAR(40),
    County VARCHAR(30),
    Country VARCHAR(30) NOT NULL,
    PostCode VARCHAR(30),
    Territory VARCHAR(30),
    PRIMARY KEY (OfficeCode)
);
 
CREATE TABLE Employees (
    EmployeeNumber VARCHAR(5) NOT NULL,
    FiName VARCHAR(30) NOT NULL,
    LaName VARCHAR(30),
    Extension INT,
    Email_Id VARCHAR(50) NOT NULL,
    Office_Code VARCHAR(5) NOT NULL,
    FOREIGN KEY (Office_Code)
        REFERENCES Offices (OfficeCode),
    JobTitle VARCHAR(50),
    OtherEmployee VARCHAR(5),
    FOREIGN KEY (OtherEmployee)
        REFERENCES Employees (EmployeeNumber),
    PRIMARY KEY (EmployeeNumber)
);
 
CREATE TABLE RetailCustomers (
    CustomerNumber VARCHAR(10) NOT NULL,
    FName VARCHAR(30) NOT NULL,
    LName VARCHAR(30),
    PhoneNumber VARCHAR(20),
    RC_AddLine1 VARCHAR(30),
    RC_AddLine2 VARCHAR(30),
    RC_City VARCHAR(30),
    RC_County VARCHAR(30),
    RC_PostalCode VARCHAR(30),
    RC_Country VARCHAR(40),
    SalesAmount DECIMAL(10 , 2 ),
    RepEmployeeNumber VARCHAR(5),
    FOREIGN KEY (RepEmployeeNumber)
        REFERENCES Employees (EmployeeNumber),
    CreditLimit DECIMAL(10 , 2 ),
    PRIMARY KEY (CustomerNumber)
);
 
 
 
CREATE TABLE PaymentsInfo (
    PaymentNumber VARCHAR(15) NOT NULL,
    Customer_No VARCHAR(10) NOT NULL,
    FOREIGN KEY (Customer_No)
        REFERENCES RetailCustomers (CustomerNumber),
    Cheque_No VARCHAR(15),
    PaymentDate DATE,
    AmountPaid DECIMAL(10 , 2 ),
    PRIMARY KEY (PaymentNumber)
);
 
 
 
CREATE TABLE ProductLine (
    ProductLineTxt VARCHAR(50) NOT NULL,
    Description VARCHAR(400),
    Website VARCHAR(300),
    ProductImage VARCHAR(500),
    PRIMARY KEY (ProductLineTxt)
);
 
CREATE TABLE Drugs (
    ProductCode VARCHAR(10) NOT NULL,
    ProductName VARCHAR(40) NOT NULL,
    ProductLine VARCHAR(40) NOT NULL,
    FOREIGN KEY (ProductLine)
        REFERENCES ProductLine (ProductLineTxt),
    ScaleWeight DECIMAL(6 , 2 ),
    Vendor VARCHAR(50),
    Description VARCHAR(400),
    QuantityStock INT,
    BuyingPrice DECIMAL(6 , 2 ),
    MSRP DECIMAL(6 , 2 ) NOT NULL,
    PRIMARY KEY (ProductCode)
);
 
 
CREATE TABLE PrescriptionOrders (
    OrderNumber VARCHAR(10) NOT NULL,
    OrderDate DATE NOT NULL,
    RequiredDate DATE,
    ShippedDate DATE,
    OrderStatus VARCHAR(30),
    Comments VARCHAR(300),
    CustomerNo VARCHAR(10) NOT NULL,
    FOREIGN KEY (CustomerNo)
        REFERENCES RetailCustomers (CustomerNumber),
    PRIMARY KEY (OrderNumber)
);
 
 
CREATE TABLE DrugPrescription (
    OrderNumber VARCHAR(10) NOT NULL,
    ProductCode VARCHAR(10) NOT NULL,
    FOREIGN KEY (OrderNumber)
        REFERENCES PrescriptionOrders (OrderNumber),
    FOREIGN KEY (ProductCode)
        REFERENCES Drugs (ProductCode),
    QuantityOrdered INT,
    Price DECIMAL(5 , 2 ),
    OrderLineNumber INT,
    PRIMARY KEY (OrderNumber , ProductCode)
);





INSERT INTO Offices (OfficeCode,City,Phone_Number,AddLine1,AddLine2,County,Country,PostCode,Territory) VALUES 
("LA156","Bath","07213703088","441 James road"," the home inn","Somerset","Great Britain","BA2 7AY"," "),
("LA157","Leicester","07284035990","9142 Highfield Road","Suite 713","South Gaston,","Great Britain","LE80 8CD"," "),
("LO112","london","07193049586","9 Clover Cl","Suite 236","Narborough"," united kingdom,","CL4 5TP"," "),
("LO113","WIGAN ","07362474230","120 Church Road","Arnold Parkway"," New Olen,","Great Britain","FL2 8OT","UK");
 
INSERT INTO Employees (EmployeeNumber,FiName,LaName,Extension,Email_Id,Office_Code,JobTitle,OtherEmployee) VALUES 
("04567","Best","Oscar-Osifo",103,"best.oscarosifo@yahooo.co.uk","LA156","scientist","04567"),
("08674","John","Payne",221,"johnsnow@gmail.com","LA157","Data scientist","04567"),
("15630","Brandon","Jim",678,"Brandonyah@yahoo.com","LO112","robot specialist","04567"),
("16915","Punn ","Somchai",984,"Punnbigbro@gmail.com","LO113","Chief data officer","04567");
 
 
INSERT INTO RetailCustomers (CustomerNumber,FName,LName,PhoneNumber,RC_AddLine1,RC_AddLine2,RC_City,RC_County,RC_PostalCode,RC_Country,SalesAmount,RepEmployeeNumber,CreditLimit) VALUES 
("1234599","bryan","tiller",07940842894,"076 King Branch","The INN","Athens","Wentworth","TA19 0SF","Greece",123.34,"15630",200.00),
("5980867","heth","penny",07889102635,"31057 Littel Extensions","The Tannery","New York","Bellefonte","NP25 5NT","USA",53.16,"04567",200.00),
("4786536","yousef","iqbal",07614248834,"590 Ulises Manors","Unit 56","Portland","Merced","CV4 9BJ","USA","1001.41","04567",2000.00),
("6757080","Punn ","Somchai",07106566340,"4915 Turnpike,","Arch apartments","Constantine","Covington","RM20 3FJ","Turkey","173.77","16915",500.00);
 
 
INSERT INTO PaymentsInfo (PaymentNumber,Customer_No,Cheque_No,PaymentDate,AmountPaid) VALUES 
("124567890","1234599","10011","2022-01-11",103.34),
("192930053","1234599","13411","2021-08-17",20.00),
("147589013","5980867","14891","2018-04-14",53.16),
("035974013","4786536","17581","2022-09-30",1001.41),
("875474256","6757080","12871","2022-12-07",173.77);
 
INSERT INTO ProductLine (ProductLineTxt,Description,Website,ProductImage) VALUES 
("Antibiotics class drugs","Antibiotics are used to treat or prevent some types of bacterial infection","https://www.Arkdrugs.co.uk/","/s_home/boo12/Downloads/arkdrugs"),
("Stimulants class drugs","Stimulants are sometimes referred to as uppers and reverse the effects of fatigue on both mental and physical tasks.","https://www.stimsforcheap.co.uk/","/s_home/boo12/Downloads/stim"),
("painkiller class drugs","Painkillers and NSAIDs, are types of drugs called analgesics, which are used to treat pain.","https://www.stopthepain.com/","/s_home/boo12/Downloads/stopp"),
("Antidepressants class drugs","Antidepressants are a type of medicine used to treat clinical depression.","https://www.liftup.co.uk/","https://www.Arkdrugs.co.uk/lift");
 
INSERT INTO Drugs (ProductCode,ProductName,ProductLine,ScaleWeight,Vendor,Description,QuantityStock,BuyingPrice,MSRP) VALUES 
("8163920788","paracetamol","painkiller class drugs","10.22","Duchefa Farma B.V.","Paracetamol is a commonly used medicine that can help treat pain and reduce a high temperature (fever).",10000,1.09,1.99),
("2379186490","Adderall","Stimulants class drugs",0.15,"Shire LLC","This combination medication is used to treat attention deficit hyperactivity disorder - ADHD",300,10.99,20.00),
("6439472905","Duloxetine","Antidepressants class drugs",1.78,"Eli Lilly & Company's ","Duloxetine is in a class of medications called selective serotonin and norepinephrine reuptake inhibitors (SNRIs)",135,15.00,21.50),
("1498635887","Penicillin","Antibiotics class drugs",3.00,"Panpharma’s","Penicillin is a medication used to manage and treat a wide range of infections.",460,17.79,19.27),
("4867729209","Concerta","Stimulants class drugs",5.4,"CST Pharma Ltd","A drug used to treat certain behavior disorders, such as attention deficit hyperactivity disorder (ADHD).",47,31.19,34.11);
 
INSERT INTO PrescriptionOrders (OrderNumber,OrderDate,RequiredDate,ShippedDate,OrderStatus,Comments,CustomerNo) VALUES 
("1NGY268901","2022-10-25","2022-11-16","2022-10-30","order shipped"," order is a behind ","1234599"),
("7FNR489075","2022-11-01","2022-11-09","2022-11-05","order shipped"," order is procceding well","5980867"),
("4NFU858380","2022-09-08","2022-09-15","2022-09-12","order shipped"," order is procceding well","1234599"),
("9HUD578393","2022-07-07","2022-07-28","2022-07-20","order shipped"," order is delivered ","6757080"),
("7HFH593950","2022-11-15","2022-11-21",null,"order proccessing"," order is proccessing","4786536");
 
INSERT INTO DrugPrescription (OrderNumber,ProductCode,QuantityOrdered,Price,OrderLineNumber) VALUES 
("1NGY268901","8163920788",1,1.09,1),
("4NFU858380","1498635887",2,17.79,2),
("7FNR489075","2379186490",1,10.99,3),
("9HUD578393","6439472905",3,15.00,4),
("7HFH593950","4867729209",1,31.19,5);





DROP VIEW IF EXISTS Customer_Order__Restricted_Info;
CREATE VIEW Customer_Order__Restricted_Info AS
    SELECT 
        CustomerNumber,
        CONCAT(FName,'',LName) As Fullname,
        CONCAT(RC_AddLine1,' ',RC_AddLine2,' ',RC_PostalCode,' ',RC_Country) AS Address,
        OrderStatus,
        QuantityOrdered,
        ShippedDate,
        CreditLimit
    FROM
        RetailCustomers
            INNER JOIN(PrescriptionOrders
                INNER JOIN (DrugPrescription
                    INNER JOIN Drugs ON DrugPrescription.ProductCode = Drugs.ProductCode) 
                ON DrugPrescription.OrderNumber =  PrescriptionOrders.OrderNumber) 
            ON RetailCustomers.CustomerNumber  = PrescriptionOrders.CustomerNo
    WHERE PrescriptionOrders.ShippedDate <  '2010-01-01' AND  RetailCustomers.CreditLimit >  1000;
SELECT * FROM  Customer_Order__Restricted_Info;

