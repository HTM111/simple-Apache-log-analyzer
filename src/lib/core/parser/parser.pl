use strict;
use warnings;

#temporally values
my @uniqueIpAdresses = ();
my %seen ;
# regex ba
my $IP_ADRESS = qr/((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)|-)/;
my $DATE_REGEX = qr/\[((?:3[0-2]|[0-2][0-9])\/(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\/[1-2][0-9][0-9][0-9]:(?:2[0-4]|[10][0-9]):[0-5][0-9]:[0-5][0-9]\s[-+][0-9]{4})\]/;
my $URL_REGEX = qr/"((?:GET|POST|PUT|PATCH|DELETE|OPTIONS)\s+[^ ]+[[:space:]]HTTP\/(?:1\.[0-9]|2))"/;
my $HTTPRES_REGEX = qr/([1-5][0-9][0-9])/;
my $CLIENTID = qr/([a-zA-Z1-9@-]+|-)/;
my $DATASIZE_REGEX = qr/([0-9]{1,8})/;
my $HTTPS_URL = qr/"(https?:\/\/(?:www\.)?[a-zA-Z0-9]+\.[a-z]+(?:\/[a-zA-Z0-9?&%-_=\/]+)?)"/;
my $USERAGENT_REGEX = qr/"(.*)"/;

# processing logs

my $totalRequests = 0;
my $totalUniqueVistors = 0;
my $totalFailedRequest = 0;
my $totalSuccessfullRequest = 0;

sub parse_line{
    my $line =$_[0];
    if ($line =~ /$IP_ADRESS\s+$IP_ADRESS\s+$CLIENTID\s+$DATE_REGEX\s+$URL_REGEX\s+$HTTPRES_REGEX\s+$DATASIZE_REGEX\s+$HTTPS_URL\s+$USERAGENT_REGEX/ ){
        analyze_log ("$1","$2","$3","$4","$5","$6")
    }
}
sub analyze_log{
    $totalRequests++;
    my @myargs = @_;
    my $statuseCode = $myargs[5];

    unless ($seen{$myargs[0]}) {
        $seen{$myargs[0]} = 1;
        $totalUniqueVistors++
    }
    if ($statuseCode == 200){
        $totalSuccessfullRequest++
    }else{
        $totalFailedRequest++
    }

}

sub openFile{
    my $filename = $_[0];
    open(my $filehandler,'<',$filename) or die "couldn't open file";
    while(my $line=<$filehandler>){
        parse_line "$line"
    }
    close($filehandler);
}
sub DashboardPrint{
    print "[+] Total request are : $totalRequests\n";
    print "[+] Total unique visitors are : $totalUniqueVistors\n";
    print "[+] Total Failed request are : $totalFailedRequest\n";
    print "[+] Total Successfull request are : $totalSuccessfullRequest\n"

}
openFile(@ARGV);
DashboardPrint()
