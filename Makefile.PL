
use ExtUtils::MakeMaker;
WriteMakefile(
		'NAME'		=>	'Tie::DNS',
		'VERSION_FROM'	=>	'lib/Tie/DNS.pm',
		'AUTHOR'	=>	'Dana M. Diederich <dana@realms.org>',
		'ABSTRACT'	=>	'Easy interface to Net::DNS',
		'dist'		=>	{ COMPRESS => 'gzip', SUFFIX => 'gz' },
		'PREREQ_PM'	=>	{
						Net::DNS	=>	0.12,
					},
             );

