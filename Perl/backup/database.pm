#!/usr/bin/perl
package database;

use lib;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertIntoDatabase);




#creating database
open(FILE, '>>', 'studentdatabase.txt') or die "Couldn't open file file.txt, $!";


#adding student details into database
sub insertIntoDatabase {
	($student_name, $student_age, $student_phone) = @_;
	chomp($student_name);
	chomp($student_age);
	chomp($student_phone);
	#This is another alternate way to store a variables in array 
	# $student_name = @_[0];
	# $student_age  = @_[1];
	# $student_phone = @_[2];
	#printing student details into database
	print FILE "$student_name~$student_age~$student_phone\n";
	print "Inserted the information into database successfully.\n";
	print "$student_name $student_age $student_phone\n";
	sleep(1);
}


close(FILE);

1;