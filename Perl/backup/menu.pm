#!/usr/bin/perl
package menu;

use lib;
use database;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(homepage header processUserAction);

BEGIN
{
    require( $INC{'database.pm'}      = 'C:/Users/harin/Desktop/StudentManagement/perlpackage/updated_perl/database.pm');
}


sub homepage {
	print "Please Enter Your Action\n";
	print "1.Add new Student\n";
	print "2.Delete Student \n";
	print "3.Search Student \n";
	print "Press 0 to exit\n";
}

#menu header
sub header {
	system("cls");
	print "***************************\n";
	print "University of Madras\n";
	print "***************************\n";
}

#get the input from user 
sub readUserAction {
	 $userAction = <STDIN>;
	 chomp($userAction);
}

#processing the user input's	
sub processUserAction {	
	readUserAction();	
	if ($userAction == 1) {
		chomp($userAction);
		header();
		addUser();		
	}
		
	elsif ($userAction == 2) {
		chomp($userAction);
		header();
		deleteUser();
	}
		
	elsif ($userAction == 3) {
		chomp($userAction);
		header();
		searchUser();
	}

	elsif ($userAction == 0) {
		chomp($userAction);
		header();
		print "Thank you!\n";
		exit();
	}
	
	
	elsif ($userAction => 5) {	
		print "invalid input\n";
		print "######\n";
		print "Please select right one\n";
		sleep(1);
	}
	
	# else {
	# exit();
	# }
}

#menu adduser
sub addUser {
	print "Enter student Name:";
	$student_name = <STDIN>;
	print "Enter student Age:";
	$student_age = <STDIN>;
	print "Enter student Phone Number:";
	$student_phone = <STDIN>;
	print "Student name $student_name is added\n";
	database::insertIntoDatabase($student_name, $student_age, $student_phone);
}



1;