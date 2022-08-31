

#menu 
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

#menu adduser
sub addUser {
	print "Enter student Name:";
	$student_name = <STDIN>;
	print "Enter student Age:";
	$student_age = <STDIN>;
	print "Enter student Phone Number:";
	$student_phone = <STDIN>;
	print "Student name $student_name is added\n";
	insertIntoDatabase($student_name, $student_age, $student_phone);
	creatingatabase($student_name, $student_age, $student_phone);
	#showData();
	sleep(1);
}


#menu deleteuser
sub deleteUser {	
	print "Delete the Name of Student:\n";
	$student_delete = <STDIN>;
	chomp($student_delete);
	deleteFromDatabase();
}	

	
sub deleteFromDatabase{	
	$check = searchIntoDatabase($student_delete);
	chomp($student_delete);	
	open (FILE, '<', 'database.txt');	
	open (FILE1, '>', 'test.txt');
	while (<FILE>) {
		if ($student_delete eq $student_search_name){
		print FILE1 $_ unless /$student_search_name/; 
		print "student $student_search_name has been deleted from database\n";
		sleep(2);
		}
		else {
		print "Student doesn't exist";
		sleep(2);
		}
	}	
}

#menu searchuser	
#search user
sub searchUser {
	print "Search the Name of Student:\n";
	$student_search = <STDIN>;
	chomp($student_search);
	sleep(1);
	searchIntoDatabase($student_search);
	
}	

#search from database	
sub searchIntoDatabase {
	($student_search) = @_;
	$found = 0;
	open(FILE, '<', 'database.txt') or die "Couldn't open file file.txt, $!";
	foreach (<FILE>) {
		@filedata = split('~', $_);
		$student_search_name = $filedata[0];
		if ($student_search eq $student_search_name){
			print "@filedata\n";
			$found = 1;
			sleep(2);
			last;
			
		}
		
	}
	if ($found eq 0){
			print "Match not found\n";
			sleep(2);
		}
		return($student_search_name);			
}

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

sub creatingatabase {
use DBI;

$driver   = "SQLite"; 
$database = "test.db";
$dsn = "DBI:$driver:dbname=$database";
$userid = "";
$password = "";
$dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) 
   or die $DBI::errstr;


print "Opened database successfully\n";
sleep(2);

# my $stmt = qq(CREATE TABLE DATABASE
   # (  NAME           TEXT    NOT NULL,
      # AGE            INT     NOT NULL,
      # PHONE        CHAR(50)););

my $rv = $dbh->do($stmt);
if($rv < 0) {
   print $DBI::errstr;
} else {
   print "Table created successfully\n";
   sleep(2);
}

$stmt = qq(INSERT INTO DATABASE (NAME,AGE,PHONE)
               VALUES ($student_name, $student_age, $student_phone));
$rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(SELECT name, address, phone from DATABASE;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
      print "NAME = ". $row[0] ."\n";
      print "ADDRESS = ". $row[1] ."\n";
      print "PHONE =  ". $row[2] ."\n\n";
}
print "Operation done successfully\n";
$dbh->disconnect();

}


#creating database
#open(FILE, '>>', 'database.txt') or die "Couldn't open file file.txt, $!";

#TODO 	

#display student details 
sub showData {
	open (FILE, '<', 'database.txt');
	while(<FILE>) {
	print "$_\n";
	sleep(1);
	}
	close(FILE);
}	

#main function
sub main {
		while (){
		header();
		homepage();
		processUserAction();
	 }	
}

main();



close(FILE);