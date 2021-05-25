Þ
iC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Controllers\LoginController.cs
	namespace 	!
AuthenticationService
 
.  
Controllers  +
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
LoginController

  
:

! "
ControllerBase

# 1
{ 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 
LoginController 
( 
IUserRepository .
userRepository/ =
)= >
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
[/ 0
FromBody0 8
]8 9
LoginInformation: J
loginInformationK [
)[ \
{ 	
var 
request 
= 
_userRepository )
.) * 
GetUserByCredentials* >
(> ?
loginInformation? O
)O P
;P Q
if 
( 
request 
== 
null 
)  
{ 
return 
NotFound 
(  
new  #
{ 
Success 
= 
false #
,# $
Message 
= 
$str 9
} 
) 
; 
} 
return 
Ok 
( 
await 
request #
)# $
;$ %
}   	
}!! 
}"" ‹
lC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Controllers\RegisterController.cs
	namespace 	!
AuthenticationService
 
.  
Controllers  +
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
RegisterController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 
RegisterController !
(! "
IUserRepository" 1
userRepository2 @
)@ A
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (

CreateUser) 3
(3 4
[4 5
FromBody5 =
]= >
RegisterInformation? R
registerInformationS f
)f g
{ 	
User 
user 
= 
await 
_userRepository -
.- .
GetUserByEmail. <
(< =
registerInformation= P
.P Q
EmailQ V
)V W
;W X
if 
( 
user 
!= 
null 
) 
{ 
return 

BadRequest !
(! "
new" %
{& '
Success 
= 
false #
,# $
Message 
= 
$str :
} 
) 
; 
} 
user 
= 
await 
_userRepository (
.( )

CreateUser) 3
(3 4
registerInformation4 G
)G H
;H I
if!! 
(!! 
user!! 
!=!! 
null!! 
)!! 
{"" 
return## 
Created## 
(## 
nameof## %
(##% &
User##& *
)##* +
,##+ ,
new##- 0
{##1 2
Success$$ 
=$$ 
true$$ "
,$$" #
Message%% 
=%% 
$str%% 9
,%%9 :
Id&& 
=&& 
user&& 
.&& 
Id&&  
}'' 
)'' 
;'' 
}(( 
return** 

StatusCode** 
(** 
$num** !
)**! "
;**" #
}++ 	
},, 
}-- Æ
^C:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Data\DataContext.cs
	namespace 	!
AuthenticationService
 
.  
Data  $
{ 
public 

class 
DataContext 
: 
	DbContext (
{ 
public 
DataContext 
( 
DbContextOptions +
<+ ,
DataContext, 7
>7 8
options9 @
)@ A
:B C
baseD H
(H I
optionsI P
)P Q
{R S
}T U
public		 
DbSet		 
<		 
User		 
>		 
Users		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} ·

dC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\DTOs\AuthenticatedUser.cs
	namespace 	!
AuthenticationService
 
.  
DTOs  $
{ 
public 

class 
AuthenticatedUser "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Token

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
AuthenticatedUser  
(  !
User! %
user& *
,* +
string, 2
token3 8
)8 9
{ 	
this 
. 
Id 
= 
user 
. 
Id 
; 
this 
. 
Token 
= 
token 
; 
this 
. 
Email 
= 
user 
. 
Email #
;# $
} 	
} 
} 
cC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\DTOs\LoginInformation.cs
	namespace 	!
AuthenticationService
 
.  
DTOs  $
{ 
public 

class 
LoginInformation !
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[

 	
Required

	 
]

 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} –
fC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\DTOs\RegisterInformation.cs
	namespace 	!
AuthenticationService
 
.  
DTOs  $
{ 
public 

class 
RegisterInformation $
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[		 	
Required			 
]		 
public

 
string

 
Password

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

* +
} 
} µ
`C:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Entities\BaseModel.cs
	namespace 	!
AuthenticationService
 
.  
Entities  (
{ 
public 

class 
	BaseModel 
{ 
} 
} ˜
[C:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Entities\User.cs
	namespace 	!
AuthenticationService
 
.  
Entities  (
{ 
public 

class 
User 
: 
	BaseModel !
{ 
[ 	
Required	 
] 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
[

 	
Required

	 
]

 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Required	 
] 
public 
DateTime 
UpdatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} Ò
hC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Helpers\AuthorizeAttribute.cs
	namespace 	!
AuthenticationService
 
.  
Helpers  '
{ 
[		 
AttributeUsage		 
(		 
AttributeTargets		 $
.		$ %
Class		% *
|		+ ,
AttributeTargets		- =
.		= >
Method		> D
)		D E
]		E F
public

 

class

 
AuthorizeAttribute

 #
:

$ %
	Attribute

& /
,

/ 0 
IAuthorizationFilter

1 E
{ 
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
var 
user 
= 
( 
User 
) 
context %
.% &
HttpContext& 1
.1 2
Items2 7
[7 8
$str8 >
]> ?
;? @
if 
( 
user 
== 
null 
) 
{ 
context 
. 
Result 
=  
new! $

JsonResult% /
(/ 0
new 
{ 
message !
=" #
$str$ 2
}3 4
)4 5
{6 7

StatusCode 
=  
StatusCodes! ,
., -!
Status401Unauthorized- B
} 
; 
} 
} 	
} 
} º$
xC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Migrations\20210412100935_InitialMigration.cs
	namespace 	!
AuthenticationService
 
.  

Migrations  *
{ 
public 

partial 
class 
InitialMigration )
:* +
	Migration, 5
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
	FirstName 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; A
,A B
nullableC K
:K L
falseM R
)R S
,S T
LastName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
falseI N
)N O
,O P
PhoneNumber 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Address 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 ?
,? @
nullableA I
:I J
falseK P
)P Q
,Q R

SchoolName 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< B
,B C
nullableD L
:L M
falseN S
)S T
,T U
Password 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
CreatedDate 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
UpdatedDate 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? E
,E F
nullableG O
:O P
falseQ V
)V W
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{   	
migrationBuilder!! 
.!! 
	DropTable!! &
(!!& '
name"" 
:"" 
$str"" 
)"" 
;"" 
}## 	
}$$ 
}%% ³"
oC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Migrations\20210426195721_Updates.cs
	namespace 	!
AuthenticationService
 
.  

Migrations  *
{ 
public 

partial 
class 
Updates  
:! "
	Migration# ,
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 

DropColumn		 '
(		' (
name

 
:

 
$str

 
,

  
table 
: 
$str 
) 
;  
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str !
,! "
table 
: 
$str 
) 
;  
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str  
,  !
table 
: 
$str 
) 
;  
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str #
,# $
table 
: 
$str 
) 
;  
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str "
," #
table 
: 
$str 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder   
.   
	AddColumn   &
<  & '
string  ' -
>  - .
(  . /
name!! 
:!! 
$str!! 
,!!  
table"" 
:"" 
$str"" 
,"" 
type## 
:## 
$str## 
,## 
nullable$$ 
:$$ 
false$$ 
,$$  
defaultValue%% 
:%% 
$str%%  
)%%  !
;%%! "
migrationBuilder'' 
.'' 
	AddColumn'' &
<''& '
string''' -
>''- .
(''. /
name(( 
:(( 
$str(( !
,((! "
table)) 
:)) 
$str)) 
,)) 
type** 
:** 
$str** 
,** 
nullable++ 
:++ 
false++ 
,++  
defaultValue,, 
:,, 
$str,,  
),,  !
;,,! "
migrationBuilder.. 
... 
	AddColumn.. &
<..& '
string..' -
>..- .
(... /
name// 
:// 
$str//  
,//  !
table00 
:00 
$str00 
,00 
type11 
:11 
$str11 
,11 
nullable22 
:22 
false22 
,22  
defaultValue33 
:33 
$str33  
)33  !
;33! "
migrationBuilder55 
.55 
	AddColumn55 &
<55& '
string55' -
>55- .
(55. /
name66 
:66 
$str66 #
,66# $
table77 
:77 
$str77 
,77 
type88 
:88 
$str88 
,88 
nullable99 
:99 
false99 
,99  
defaultValue:: 
::: 
$str::  
)::  !
;::! "
migrationBuilder<< 
.<< 
	AddColumn<< &
<<<& '
string<<' -
><<- .
(<<. /
name== 
:== 
$str== "
,==" #
table>> 
:>> 
$str>> 
,>> 
type?? 
:?? 
$str?? 
,?? 
nullable@@ 
:@@ 
false@@ 
,@@  
defaultValueAA 
:AA 
$strAA  
)AA  !
;AA! "
}BB 	
}CC 
}DD °
UC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Program.cs
	namespace 	!
AuthenticationService
 
{ 
public 

static 
class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. 
ConfigureLogging !
(! "
logging" )
=>* ,
{ 
logging 
. 
ClearProviders *
(* +
)+ ,
;, -
logging 
. 

AddConsole &
(& '
)' (
;( )
} 
) 
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ¢
jC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Repositories\IUserRepository.cs
	namespace 	!
AuthenticationService
 
.  
Repositories  ,
{ 
public 

	interface 
IUserRepository $
{ 
Task		 
<		 
User		 
>		 

CreateUser		 
(		 
RegisterInformation		 1
registerInformation		2 E
)		E F
;		F G
Task

 
<

 
AuthenticatedUser

 
>

  
GetUserByCredentials

  4
(

4 5
LoginInformation

5 E
loginInformation

F V
)

V W
;

W X
Task 
< 
User 
> 
GetUserByEmail !
(! "
string" (
email) .
). /
;/ 0
} 
} œD
iC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Repositories\UserRepository.cs
	namespace 	!
AuthenticationService
 
.  
Repositories  ,
{ 
public 

class 
UserRepository 
:  !
IUserRepository" 1
{ 
private 
readonly 
DataContext $
_context% -
;- .
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
ILogger  
_logger! (
;( )
public 
UserRepository 
( 
DataContext )
context* 1
,1 2
IConfiguration3 A
configurationB O
,O P
ILoggerQ X
<X Y
objectY _
>_ `
loggera g
)g h
{ 	
_logger 
= 
logger 
; 
_context 
= 
context 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
< 
User 
> 

CreateUser  *
(* +
RegisterInformation+ >
registerInformation? R
)R S
{   	
string!! 
encriptedPassword!! $
=!!% &
EncryptPassword!!' 6
(!!6 7
registerInformation!!7 J
.!!J K
Password!!K S
)!!S T
;!!T U
var## 
user## 
=## 
new## 
User## 
{$$ 
Id%% 
=%% 
Guid%% 
.%% 
NewGuid%% !
(%%! "
)%%" #
,%%# $
Email&& 
=&& 
registerInformation&& +
.&&+ ,
Email&&, 1
,&&1 2
Password'' 
='' 
encriptedPassword'' ,
,'', -
CreatedDate(( 
=(( 
DateTime(( &
.((& '
Now((' *
,((* +
UpdatedDate)) 
=)) 
DateTime)) &
.))& '
Now))' *
}** 
;** 
await,, 
_context,, 
.,, 
Users,,  
.,,  !
AddAsync,,! )
(,,) *
user,,* .
),,. /
;,,/ 0
_context-- 
.-- 
SaveChanges--  
(--  !
)--! "
;--" #
return// 
user// 
;// 
}00 	
public22 
Task22 
<22 
AuthenticatedUser22 %
>22% & 
GetUserByCredentials22' ;
(22; <
LoginInformation22< L
loginInformation22M ]
)22] ^
{33 	
string44 
encriptedPassword44 $
=44% &
EncryptPassword44' 6
(446 7
loginInformation447 G
.44G H
Password44H P
)44P Q
;44Q R
User55 
user55 
=55 
_context55  
.55  !
Users55! &
.55& '
FirstOrDefault55' 5
(555 6
u556 7
=>558 :
u66 
.66 
Email66 
.66 
Equals66 
(66 
loginInformation66 /
.66/ 0
Email660 5
)665 6
&&667 9
u66: ;
.66; <
Password66< D
.66D E
Equals66E K
(66K L
encriptedPassword66L ]
)66] ^
)77 
;77 
_logger99 
.99 
LogInformation99 "
(99" #
$str99# 0
)990 1
;991 2
if:: 
(:: 
user:: 
==:: 
null:: 
):: 
{;; 
_logger<< 
.<< 
LogInformation<< &
(<<& '
$str<<' 1
)<<1 2
;<<2 3
return== 
Task== 
.== 

FromResult== &
<==& '
AuthenticatedUser==' 8
>==8 9
(==9 :
null==: >
)==> ?
;==? @
}>> 
var@@ 
token@@ 
=@@ 
generateJwtToken@@ (
(@@( )
user@@) -
)@@- .
;@@. /
returnBB 
TaskBB 
.BB 

FromResultBB "
(BB" #
newBB# &
AuthenticatedUserBB' 8
(BB8 9
userBB9 =
,BB= >
tokenBB? D
)BBD E
)BBE F
;BBF G
}CC 	
publicEE 
TaskEE 
<EE 
UserEE 
>EE 
GetUserByEmailEE (
(EE( )
stringEE) /
emailEE0 5
)EE5 6
{FF 	
returnGG 
TaskGG 
.GG 

FromResultGG "
(GG" #
_contextGG# +
.GG+ ,
UsersGG, 1
.GG1 2
FirstOrDefaultGG2 @
(GG@ A
uGGA B
=>GGC E
uGGF G
.GGG H
EmailGGH M
.GGM N
EqualsGGN T
(GGT U
emailGGU Z
)GGZ [
)GG[ \
)GG\ ]
;GG] ^
}HH 	
privateJJ 
staticJJ 
stringJJ 
EncryptPasswordJJ -
(JJ- .
stringJJ. 4
inputJJ5 :
)JJ: ;
{KK 	
usingLL 
varLL 
hashAlgorithmLL #
=LL$ %
SHA256LL& ,
.LL, -
CreateLL- 3
(LL3 4
)LL4 5
;LL5 6
varMM 
dataMM 
=MM 
hashAlgorithmMM $
.MM$ %
ComputeHashMM% 0
(MM0 1
EncodingMM1 9
.MM9 :
UTF8MM: >
.MM> ?
GetBytesMM? G
(MMG H
inputMMH M
)MMM N
)MMN O
;MMO P
varNN 
outputNN 
=NN 
newNN 
StringBuilderNN *
(NN* +
)NN+ ,
;NN, -
foreachPP 
(PP 
varPP 
tPP 
inPP 
dataPP "
)PP" #
{QQ 
outputRR 
.RR 
AppendRR 
(RR 
tRR 
.RR  
ToStringRR  (
(RR( )
$strRR) -
)RR- .
)RR. /
;RR/ 0
}SS 
returnUU 
outputUU 
.UU 
ToStringUU "
(UU" #
)UU# $
;UU$ %
}VV 	
privateWW 
stringWW 
generateJwtTokenWW '
(WW' (
UserWW( ,
userWW- 1
)WW1 2
{XX 	
varYY 
tokenHandlerYY 
=YY 
newYY "#
JwtSecurityTokenHandlerYY# :
(YY: ;
)YY; <
;YY< =
varZZ 
keyZZ 
=ZZ 
EncodingZZ 
.ZZ 
ASCIIZZ $
.ZZ$ %
GetBytesZZ% -
(ZZ- .
_configurationZZ. <
.ZZ< =
GetValueZZ= E
<ZZE F
stringZZF L
>ZZL M
(ZZM N
$strZZN c
)ZZc d
)ZZd e
;ZZe f
var[[ 
tokenDescriptor[[ 
=[[  !
new[[" %#
SecurityTokenDescriptor[[& =
{\\ 
Subject]] 
=]] 
new]] 
ClaimsIdentity]] ,
(]], -
new]]- 0
[]]0 1
]]]1 2
{]]3 4
new]]5 8
Claim]]9 >
(]]> ?
$str]]? C
,]]C D
user]]E I
.]]I J
Id]]J L
.]]L M
ToString]]M U
(]]U V
)]]V W
)]]W X
}]]Y Z
)]]Z [
,]][ \
Expires^^ 
=^^ 
DateTime^^ "
.^^" #
UtcNow^^# )
.^^) *
AddDays^^* 1
(^^1 2
$num^^2 3
)^^3 4
,^^4 5
SigningCredentials__ "
=__# $
new__% (
SigningCredentials__) ;
(__; <
new__< ? 
SymmetricSecurityKey__@ T
(__T U
key__U X
)__X Y
,__Y Z
SecurityAlgorithms__[ m
.__m n 
HmacSha256Signature	__n 
)
__ ‚
}`` 
;`` 
varaa 
tokenaa 
=aa 
tokenHandleraa $
.aa$ %
CreateTokenaa% 0
(aa0 1
tokenDescriptoraa1 @
)aa@ A
;aaA B
returncc 
tokenHandlercc 
.cc  

WriteTokencc  *
(cc* +
tokencc+ 0
)cc0 1
;cc1 2
}dd 	
}ee 
}ff Ü
UC:\Users\eucar\OneDrive\Desktop\Servicii dotnet\tfg-authentication-service\Startup.cs
	namespace 	!
AuthenticationService
 
{ 
public 

class 
Startup 
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
_config 
= 
configuration #
;# $
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{3 4
Title5 :
=; <
$str= U
,U V
VersionW ^
=_ `
$stra e
}f g
)g h
;h i
} 
) 
; 
services!! 
.!! 
AddDbContext!! !
<!!! "
DataContext!!" -
>!!- .
(!!. /
options!!/ 6
=>!!7 9
{!!: ;
options"" 
."" 
	UseSqlite"" !
(""! "
_config""" )
."") *
GetConnectionString""* =
(""= >
$str""> Q
)""Q R
)""R S
;""S T
}## 
)## 
;## 
services%% 
.%% 
	AddScoped%% 
<%% 
IUserRepository%% .
,%%. /
UserRepository%%0 >
>%%> ?
(%%? @
)%%@ A
;%%A B
}&& 	
public)) 
void)) 
	Configure)) 
()) 
IApplicationBuilder)) 1
app))2 5
,))5 6
IWebHostEnvironment))7 J
env))K N
)))N O
{** 	
if++ 
(++ 
env++ 
.++ 
IsDevelopment++ !
(++! "
)++" #
)++# $
{,, 
app-- 
.-- %
UseDeveloperExceptionPage-- -
(--- .
)--. /
;--/ 0
app.. 
... 

UseSwagger.. 
(.. 
)..  
;..  !
app// 
.// 
UseSwaggerUI//  
(//  !
c//! "
=>//# %
c//& '
.//' (
SwaggerEndpoint//( 7
(//7 8
$str//8 R
,//R S
$str//T f
)//f g
)//g h
;//h i
}00 
app22 
.22 
UseHttpsRedirection22 #
(22# $
)22$ %
;22% &
app44 
.44 

UseRouting44 
(44 
)44 
;44 
app66 
.66 
UseAuthorization66  
(66  !
)66! "
;66" #
app88 
.88 
UseEndpoints88 
(88 
	endpoints88 &
=>88' )
{99 
	endpoints:: 
.:: 
MapControllers:: (
(::( )
)::) *
;::* +
};; 
);; 
;;; 
}<< 	
}== 
}>> 