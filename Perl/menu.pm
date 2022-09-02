#!/usr/bin/perl
package menu;

use lib;
use database;
use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(homepage header processUserAction);

# BEGIN
# {
    # require( $INC{'database.pm'}      = 'C:/Users/harin/Desktop/StudentManagement/perlpackage/updated_perl/database.pm');
# }


sub homepage {
	print "Please Enter Your Action\n";
	print "1.Add new Student\n";
	print "2.Delete Student \n";
	print "3.Search Student \n";
	print "4.Show Student Details\n";
	print "5.Update Student Details\n";
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
		deleteStudentName();
	}
		
	elsif ($userAction == 3) {
		chomp($userAction);
		header();
		searchStudentDetails();
	}

	elsif ($userAction == 4){
		chomp($userAction);
		header();
		database::showDatabase();
	}
	
	elsif ($userAction == 5) {
		chomp($userAction);
		header();
		UpdateStudentDeails();
	}		
		
	elsif ($userAction == 0) {
		chomp($userAction);
		header();
		print "Thank you!\n";
		exit();
	}
	
	
	elsif ($userAction => 6) {	
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
	#database::creatingatabase();
}

sub searchStudentDetails{
	print "Enter the Name to Find the Student Details: ";
	$student_search_name = <STDIN>;
	print "Searching.......\n";
	sleep(1);
	database::searchFromDatabase();
}

sub deleteStudentName{
	header();
	print "DELETE STUDENT Details\n\n";
	print "Enter a Name to Delete :";
	$delete_name = <STDIN>;
	database::deleteFromDatabase($delete_name);
}	


sub UpdateStudentDeails{
	header();
	print "Update STUDENT Details\n\n";
	print "Enter Student NAME :";
	$student_name = <STDIN>;
	print "Enter Update PhoneNumber :";
	$Update_phone = <STDIN>;
	database::updateDetails($student_name,$Update_phone);
}	
1;