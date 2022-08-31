#!/usr/bin/perl
package database;

use DBI;
use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertIntoDatabase);


#open(FILE, '>>', 'studentDatabase.db') or die "Couldn't open file file.txt, $!";

sub creatingDatabase {
	$driver   = "SQLite"; 
	$database = "studentDatabase.db";
	$dsn = "DBI:$driver:dbname=$database";
	$userid = "";
	$password = "";
	$dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr; 
	print "connected to the database\n";
		
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
	#$dbh->disconnect();
	return ($dbh, $stmt);
}

		
sub selectFromDatabase{	
	($dbh, $stmt)= @_;
	$sth = $dbh->prepare($stmt);
	$rv = $sth->execute() or die $DBI::errstr;
	
	if($rv < 0) {
	print $DBI::errstr;
	}
	
	while(@row = $sth->fetchrow_array()) {
		print "NAME = ". $row[0] . "\n";
		print "AGE = ". $row[1] ."\n";
		print "PHONE = ". $row[2] ."\n";
	}
	print "Operation done successfully\n";
	$dbh->disconnect();
}

#adding student details into database
sub insertIntoDatabase {
	($dbh, $stmt)= @_;
	($student_name, $student_age, $student_phone) = @naveen;
	chomp($student_name);
	chomp($student_age);
	chomp($student_phone);
	creatingDatabase();
	
	#This is another alternate way to store a variables in array 
	# $student_name = @_[0];
	# $student_age  = @_[1];
	# $student_phone = @_[2];
	
	#printing student details into database
	$stmt = $dbh->prepare("INSERT INTO STUDENTDATABASE VALUES (NAME, AGE, PHONE)");
	$rv = $stmt->execute( $student_name, $student_age, $student_phone ) or die $DBI::errstr;
	
	# $stmt = qq(INSERT INTO STUDENTDATABASE (NAME,AGE,PHONE)
               # VALUES ('Allen', 25, 1832947198));
	# $rv = $dbh->do($stmt) or die $DBI::errstr;
	
	# $stmt = qq(INSERT INTO DATABASE (NAME,AGE,PHONE)
               # VALUES ($student_name, $student_age, $student_phone));
	# $rv = $dbh->do($stmt) or die $DBI::errstr;
	
	print "Inserted the information into database successfully.\n";
	
	selectFromDatabase();
	print "$student_name $student_age $student_phone\n";
	sleep(2);
}

1;