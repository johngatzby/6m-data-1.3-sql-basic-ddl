--Case Study 1: The "Tiny Library" (Schema Design)--

CREATE SCHEMA IF NOT EXISTS library; 

CREATE TABLE library.books (

    ISBN varchar(13) primary key,
    title varchar not null,
    author varchar not null
);

create table library.members(

    id int primary key,
    name varchar not null,
    email varchar unique check(contains(email,'@')),
    join_date date not null 

);

CREATE table library.loans(

    id int primary key,
    loan_date date not null,
    return_date date,
    title_id varchar(13) references library.books(ISBN),
    member_id int references library.members(id)
    
);

--Case Study 2: The "Marketing Dump" (Data Ingestion)--


create table marketing_leads (

    id varchar,
    full_name varchar,
    contact_info varchar,
    signup_date varchar
);

COPY marketing_leads FROM 'https://raw.githubusercontent.com/su-ntu-ctp/6m-data-1.3-sql-basic-ddl/refs/heads/main/data/leads_raw.csv' (AUTO_DETECT TRUE);

CREATE VIEW valid_leads AS

SELECT id, full_name, contact_info,signup_date

FROM marketing_leads

WHERE contains(contact_info,'@');

SELECT * FROM valid_leads;
