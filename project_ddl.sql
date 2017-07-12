DROP SCHEMA hotel CASCADE;
CREATE SCHEMA hotel;

SET SEARCH_PATH TO hotel;

create table Family(
      Guest_ID          	varchar(5) ,
      Family_Head_SSN   	varchar(9) ,
      Address           	varchar(50),
      Mobile_No          	decimal(10,0),
      No_Of_Adults      	smallint,
      No_Of_Children    	smallint,
      primary key(Guest_ID),
      foreign key(Guest_ID) references Guest(Guest_ID)
       ON DELETE CASCADE
);

create table Company(
      Guest_ID              varchar(5) primary key,
      CName                 varchar(40),
      Location              varchar(50),
      foreign key(Guest_ID) references Guest(Guest_ID)
			ON DELETE CASCADE
);

create table Guest(
       Guest_ID       varchar(5) primary key,
       Entry_Time     timestamp
  
);

create table Family_Members(
       Guest_ID            varchar(5),
       Name                varchar(40),
       Age                 smallint,
       primary key(Guest_ID,Name),
       foreign key(Guest_ID) references Family(Guest_ID)
               ON DELETE CASCADE
);

create table Company_Members(
       Guest_ID     varchar(5),
       Name         varchar(40),
       Age          smallint,
       Designation  varchar(40),
       primary key(Name, Guest_ID),
       foreign key(Guest_ID)  references Company(Guest_ID)
                ON DELETE CASCADE
);

create table Room(
       Room_No         varchar(5) primary key,
       Type            varchar(50),
       Rate            int,
       Status_Occupied boolean
);

create table Alloted(
       Guest_ID        varchar(5),
       Room_No         varchar(5),
       Check_in_date   Date,
       Check_out_date  Date,
       primary key(Guest_ID, Room_No),
       foreign key(Guest_ID)  references Guest(Guest_ID)
                ON DELETE CASCADE,     
       foreign key(Room_No) references Room(Room_No)
                ON DELETE CASCADE
);

create table BILL (
       Guest_ID          varchar(5) primary key,
       Amount            int,
       Payment_Date      Date,
       Paying_Method     varchar(20),
       foreign key(Guest_ID)  references Guest(Guest_ID)
                ON DELETE CASCADE
);

CREATE TABLE Facility (
	Facility_id	varchar(5) primary key,
	Rate		int,
	No_of_hours     int,
	Facility_type	varchar(40)
   
);

create table uses (
        Guest_ID       varchar(5),
        Facility_id    varchar(5),
        Quantity_used  int,
        primary key(Guest_ID, Facility_id),
        foreign key(Guest_ID)  references Guest(Guest_ID)
                ON DELETE CASCADE,     
        foreign key(Facility_id) references Facility(Facility_id)
                ON DELETE CASCADE
);

        
create table Food (
        Product_ID   varchar(5) primary key, 
        Rate         int,
        Type         varchar(60),
        Name         varchar(60)
);



create table Orders (
        Guest_ID        varchar(5),
        Product_ID      varchar(5),
        Date_Of_Orders  Date,
        Time            TIME,
        Quantity        smallint,
        primary key(Guest_ID, Product_ID, Date_of_Orders, Time),
        foreign key(Guest_ID)  references Guest(Guest_ID)
                ON DELETE CASCADE,     
        foreign key(Product_ID) references Food(Product_ID)
                ON DELETE CASCADE
);
