Create database MC5_Signum_Libri;
Use MC5_Signum_Libri;

Create table agent (
	Agentid char(6) not null,
	Agentname varchar(40) not null,
	Primary key(Agentid));
    
Create table writer(
	Writerid char(6) not null,
	Writername varchar(40) not null,
	Agentid char(6) not null,
	Primary key(Writerid),
	Foreign key(Agentid) references agent(Agentid));
    
   Create table editor(
	Editorid char(6) not null,
	Editorname varchar(40),
	Mentor_editorid char(6),
	Primary key(Editorid),
	Foreign key(Mentor_editorid) references editor(Editorid));
 
    Create table book(
	Bookname varchar(40) not null,
	Bookgenre varchar(40),
	Bookdateofpub date,
	Booknoofpages int,
	Editorid char(6) not null,
	Writerid char(6) not null,
	Primary key(bookname),
	Foreign key(Editorid) references editor(Editorid),
	Foreign key(Writerid) references writer(Writerid));

show tables from MC5_Signum_Libri;

Create table drop_table(
tablename char(6),
tableid char(6) not null,
primary key(tableid));

drop table drop_table;

Alter table agent add(example1 char(6));
Alter table agent add(example2 char(6));
Alter table agent drop example2;



