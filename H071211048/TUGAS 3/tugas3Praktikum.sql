-- nomor 1
insert into employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
value (1003,"Olivia", "Wirya", "x6389", "wiiryaolivia@classicmodelcars.com", 2, 1102, "sales rep"), 
(1004, "Swift", "Taylor", "x7843", "taylorswft@classicmodelcars.com", 6, 1143, "sales rep"),
(1005, "Sheeran", "Ed", "x9623", "edsheeran@classicmodelcars.com", 1, 1056, "sales manager");

-- nomor 2
insert into offices
values (8, 'makassar', '+6282198762345', 'Jl. Perintis Kemerdekaan', null, 'Sulsel', 'Indonesia', 90245, 'SEA' );
update employees set officeCode = 8 
where jobTitle = 'Sales Rep' and officeCode =4;

-- nomor 3 
delete from payments where amount < 10000;