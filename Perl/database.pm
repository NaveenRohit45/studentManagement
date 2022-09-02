#!/usr/bin/perl
package database;

use DBI;
use strict;
use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertIntoDatabase showDatabase searchFromDatabase deleteFromDatabase updateDetails);

sub creatingDatabase {
	$driver   = "SQLite"; 
	$database = "studentDatabase.db";
	$dsn = "DBI:$driver:dbname=$database";
	$userid = "";
	$password = "";
	$dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr; 
	print "connected to the database\n";
}		

sub creatingTable{	
	$stmt = qq(CREATE TABLE IF NOT EXISTS STUDENTDATABASE
		(NAME     TEXT    NOT NULL,
		AGE         INT     NOT NULL,
		PHONE       INT););
		
	$rv = $dbh->do($stmt);
	if($rv < 0) {
		print $DBI::errstr;
	}
	else {
		print "Table created successfully\n";
		sleep(2);
	}
	return ($dbh, $stmt);
}

		
#adding student details into database
sub insertIntoDatabase {
	($student_name, $student_age, $student_phone) = @_;
	chomp($student_name123);
	chomp($student_age);
	chomp($student_phone);
	creatingDatabase();
	#printing student details into database
	$stmt = $dbh->prepare("INSERT INTO STUDENTDATABASE(Name, Age, Phone)
				VALUES(?,?,?)");
	$stmt->execute( $student_name, $student_age, $student_phone ) or die $DBI::errstr;
	$stmt->finish();	
	print "$student_name $student_age $student_phone\n";
	print "Inserted the information into database successfully.\n";
	sleep(2);
}

sub showDatabase {
		creatingDatabase();
		$stmt= $dbh->prepare ("SELECT * FROM STUDENTDATABASE");
		$stmt->execute () or die $DBI::errstr;
		while (@row = $stmt->fetchrow_array()){
			($ID, $NAME, $AGE, $PHONE) = @row;
			print "$ID $NAME $AGE $PHONE\n";
			sleep(2);
		}
		$stmt->finish();
}

sub searchFromDatabase {
	creatingDatabase();
	($student_search_name) = @_;
	chomp($student_search_name);
	$found = 0;
	$stmt = $dbh->prepare ("SELECT NAME,AGE,PHONE FROM STUDENTDATABASE
	WHERE NAME = ?");
	$stmt-> execute($student_search_name) or die $DBI::errstr;
	while (@row = $stmt->fetchrow_array()){
		$student_search_name == @row;
		print "@row\n";
		sleep(2);
		$found = 1;
	$stmt->finish();
	}	
	
	if ($found == 0){
		print "Student Details Not Found\n";
		sleep(1);
	}	
}
sub deleteFromDatabase{
	creatingDatabase();
	($delete_name) = @_;
	chomp($delete_name);
	$sth = $dbh->prepare("DELETE FROM STUDENTDATABASE
	WHERE Name = ?");
	$sth->execute($delete_name) or die $DBI::errstr;
	print "Student $delete_name Details has been Deleted  from Database\n";
	sleep(2);			
}

sub updateDetails{
	creatingDatabase();
	($student_name,$Update_phone) = @_;
	chomp($student_name);
	chomp($Update_phone);
	$stmt = $dbh->prepare("UPDATE STUDENTDATABASE
	SET Phone = ?
	WHERE Name = ?");
	$stmt->execute($Update_phone,$student_name) or die $DBI::errstr;
	$stmt->finish();
	print "$student_name&$Update_phone\n";
	print "Updated successfully..!";
	sleep(1);	
}	
1;