[1mdiff --git a/All sql querry in sportsclub.sql b/All sql querry in sportsclub.sql[m
[1mdeleted file mode 100644[m
[1mindex 8176e7c..0000000[m
[1m--- a/All sql querry in sportsclub.sql[m	
[1m+++ /dev/null[m
[36m@@ -1,278 +0,0 @@[m
[31m-[m
[31m-secure_login.php*******************************[m
[31m-$user_id_auth = mysqli_real_escape_string($con, $user_id_auth);[m
[31m-$pass_key     = mysqli_real_escape_string($con, $pass_key);[m
[31m-[m
[31m-$sql  = "SELECT * FROM admin WHERE username='$user_id_auth' and pass_key='$pass_key'";[m
[31m-[m
[31m-change_s_pwd.php***************************[m
[31m-$sql    = "SELECT * FROM admin WHERE username='$user_id_auth' and securekey='$key'";[m
[31m-[m
[31m-[m
[31m-admin/del_member.php*****************************[m
[31m- mysqli_query($con, "DELETE FROM users WHERE userid='$msgid'");[m
[31m-[m
[31m-admin/del_plan.php****************************[m
[31m-mysqli_query($con, "update plan set active ='no' WHERE pid='$msgid'");[m
[31m-[m
[31m-[m
[31m-admin/deleteroutine.php****************************[m
[31m-mysqli_query($con, "DELETE FROM sports_timetable WHERE tid='$msgid'");[m
[31m-[m
[31m-[m
[31m-admin/edit_mem_submit.php**************************[m
[31m- $query1="update users set username='".$uname."',gender='".$gender."',mobile='".$mobile."',email='".$email."',dob='".$dob."',joining_date='".$jdate."' where userid='".$uid."'";[m
[31m-[m
[31m-   if(mysqli_query($con,$query1))[m
[31m-   {[m
[31m-     $query2="update address set streetName='".$stname."',state='".$state."',city='".$city."',zipcode='".$zipcode."' where id='".$uid."'";[m
[31m-     if(mysqli_query($con,$query2)){[m
[31m-        $query3="update health_status set calorie='".$calorie."',height='".$height."',weight='".$weight."',fat='".$fat."',remarks='".$remarks."' where uid='".$uid."'";[m
[31m-[m
[31m-admin/edit_member.php*****************************************[m
[31m- $query  = "SELECT * FROM users u [m
[31m- 			INNER JOIN address a ON u.userid=a.id[m
[31m-			INNER JOIN  health_status h ON u.userid=h.uid[m
[31m-			WHERE userid='$memid'";[m
[31m-[m
[31m-admin/edit_plan.php*********************************************[m
[31m-$id=$_GET['id'];[m
[31m-		$sql="Select * from plan t Where t.pid=$id";[m
[31m-[m
[31m-admin/editdetailroutine.php*****************************************[m
[31m-$id=$_GET['id'];[m
[31m-		$sql="Select * from sports_timetable t Where t.tid=$id";[m
[31m-[m
[31m-admin/editroutine.php***********************************************[m
[31m-$query  = "select * from sports_timetable";[m
[31m-[m
[31m-admin/get_invoice.php*******************************************************[m
[31m-$sql = "Select * from users u INNER JOIN enrolls_to e ON u.userid=e.uid INNER JOIN plan p where p.pid=e.pid and userid='".$uid."' and e.et_id='".$etid."'";[m
[31m-	$res=mysqli_query($con, $sql);[m
[31m-	 if($res){[m
[31m-	$row=mysqli_fetch_array($res,MYSQLI_ASSOC);[m
[31m-[m
[31m-[m
[31m-admin/health_status_entry.php*****************************************************[m
[31m-$query="update health_status set calorie='".$calorie."', height='".$height."',weight='".$weight."',fat='".$fat."',remarks='".$remarks."' where uid='".$userid."'";[m
[31m-[m
[31m-$sql="select * from health_status where uid='".$uid."'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/income_month.php********************************************[m
[31m-$month=$_GET['mm'];[m
[31m-$year=$_GET['yy'];[m
[31m-[m
[31m-$query="select DISTINCT u.userid,u.username,u.gender,u.mobile,[m
[31m-u.email,u.joining_date,a.state,a.city,[m
[31m-e.paid_date,e.expire,p.planName,p.amount,p.validity from users u [m
[31m-INNER JOIN address a on u.userid=a.id [m
[31m-INNER JOIN enrolls_to e on u.userid=e.uid[m
[31m-INNER JOIN plan p on p.pid=e.pid[m
[31m-where e.paid_date  like '".$year."-".$month."___'";[m
[31m-[m
[31m-[m
[31m-admin/make_payment.php*************************************************[m
[31m-$uid  = $_POST['userID'];[m
[31m-$planid=$_POST['planID'];[m
[31m-		$query1 = "select * from users WHERE userid='$uid'";[m
[31m-$name = $row1['username'];[m
[31m-		$query2="select * from plan where pid='$planid'";[m
[31m-[m
[31m-[m
[31m-ADMIN/index.php*******************************************************************************************************[m
[31m-<h2>Paid Income This Month</h2><br>	[m
[31m-date_default_timezone_set("Asia/Calcutta"); [m
[31m-	$date  = date('Y-m');[m
[31m-	$query = "select * from enrolls_to WHERE  paid_date LIKE '$date%'";[m
[31m-[m
[31m-[m
[31m-while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {[m
[31m-	$query1="select * from plan where pid='".$row['pid']."'";[m
[31m-	$result1=mysqli_query($con,$query1);[m
[31m-[m
[31m-<h2>Total <br>Members</h2><br>[m
[31m-query = "select COUNT(*) from users";[m
[31m-[m
[31m-<h2>Joined This Month</h2><br>[m
[31m-date_default_timezone_set("Asia/Calcutta"); [m
[31m-	$date  = date('Y-m');[m
[31m-	$query = "select COUNT(*) from users WHERE joining_date LIKE '$date%'";[m
[31m-[m
[31m-<h2>Total Plan Available</h2><br>	[m
[31m-	<?php[m
[31m-	$query = "select COUNT(*) from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/make_payment.php***************************************[m
[31m-$uid  = $_POST['userID'];[m
[31m-    $planid=$_POST['planID'];[m
[31m-    $query1 = "select * from users WHERE userid='$uid'";[m
[31m-[m
[31m-$name = $row1['username'];[m
[31m-    $query2="select * from plan where pid='$planid'";[m
[31m-[m
[31m-[m
[31m-<td height="35"><select name="plan" id="boxx" required onchange="myplandetail(this.value)">[m
[31m-	<option value=""> - Please select - </option>[m
[31m-	<?php[m
[31m-	$query = "select * from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-admin/more_userprofile.php**********************************************[m
[31m-$usrname=$_POST['login_id'];[m
[31m- $fulname=$_POST['full_name'];[m
[31m- $query="update admin set username='".$usrname."',Full_name='".$fulname."' where username='".$_SESSION['full_name']."'";[m
[31m-[m
[31m-[m
[31m-admin/new 1.php*******************************************************[m
[31m-$query  = "select * from enrolls_to where renewal='yes' ORDER BY expire";[m
[31m-[m
[31m-$query1  = "select * from users WHERE userid='$uid'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/new_entry.php*************************************************[m
[31m-$query="select * from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-admin/new_health_status.php**********************************************[m
[31m-$query  = "select * from users ORDER BY joining_date";[m
[31m-[m
[31m- $query1  = "select * from enrolls_to WHERE uid='$uid' AND renewal='yes'";[m
[31m-[m
[31m-[m
[31m-ADMIN/new_submit.php**************************************************************************************************************[m
[31m-//inserting into users table[m
[31m-$query="insert into users(username,gender,mobile,email,dob,joining_date,userid) values('$uname','$gender','$phn','$email','$dob','$jdate','$memID')";[m
[31m-[m
[31m-//Retrieve information of plan selected by user[m
[31m-      $query1="select * from plan where pid='$plan'";[m
[31m-[m
[31m-//inserting into enrolls_to table of corresponding userid[m
[31m-          $query2="insert into enrolls_to(pid,uid,paid_date,expire,renewal) values('$plan','$memID','$cdate','$expiredate','yes')";[m
[31m-[m
[31m- $query4="insert into health_status(uid) values('$memID')";[m
[31m-  $query5="insert into address(id,streetName,state,city,zipcode) values('$memID','$stname','$state','$city','$zipcode')";[m
[31m-[m
[31m-//Deleting record of users if inserting to enrolls_to table failed to execute[m
[31m-    $query3 = "DELETE FROM users WHERE userid='$memID'";[m
[31m-[m
[31m-[m
[31m-//Deleting record of users if inserting to enrolls_to table failed to execute[m
[31m-     $query3 = "DELETE FROM users WHERE userid='$memID'";[m
[31m-[m
[31m-//Deleting record of users if inserting to enrolls_to table failed to execute[m
[31m-    $query3 = "DELETE FROM users WHERE userid='$memID'";[m
[31m-[m
[31m-//Deleting record of users if retrieving inf of plan failed[m
[31m-          $query3 = "DELETE FROM users WHERE userid='$memID'";[m
[31m-[m
[31m-[m
[31m-admin/over_month.php***********************************************************[m
[31m-if($flag==0)[m
[31m-	$query="select * from users u INNER JOIN address a on u.userid=a.id where u.joining_date like '".$year."-".$month."___'";[m
[31m-else if($flag==1)[m
[31m-	$query="select * from users u INNER JOIN address a on u.userid=a.id where u.joining_date like '".$year."______'";[m
[31m-[m
[31m-[m
[31m-admin/payment.php*****************************************************[m
[31m-	$query  = "select * from enrolls_to where renewal='yes' ORDER BY expire";[m
[31m-[m
[31m-$uid   = $row['uid'];[m
[31m-$planid=$row['pid'];[m
[31m-$query1  = "select * from users WHERE userid='$uid'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/plandetail.php***********************************************[m
[31m-$pid=$_GET['q'];[m
[31m-$query="select * from plan where pid='".$pid."'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/read_member.php************************************************************[m
[31m-$id     = $_POST['name'];[m
[31m-		$query  = "select * from users WHERE userid='$id'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/saveroutine.php**************************************************[m
[31m-$rname=$_POST["rname"];[m
[31m-		$day1=$_POST["day1"];[m
[31m-		$day2=$_POST["day2"];[m
[31m-		$day3=$_POST["day3"];[m
[31m-	    $day4=$_POST["day4"];[m
[31m-		$day5=$_POST["day5"];[m
[31m-		$day6=$_POST["day6"];[m
[31m-		$pid=$_POST["pidd"];[m
[31m-		[m
[31m-		[m
[31m-		$sql="insert into sports_timetable(tname,day1,day2,day3,day4,day5,day6,pid) values('$rname','$day1','$day2','$day3','$day4','$day5','$day6','$pid')";[m
[31m-[m
[31m-[m
[31m-ADMIN/submit_payment.php*******************************************************************************[m
[31m-//updating renewal from yes to no from enrolls_to table[m
[31m-$query="update enrolls_to set renewal='no' where uid='$memID'";[m
[31m-[m
[31m-//inserting new payment data into enrolls_to table[m
[31m-      $query1="select * from plan where pid='$plan'";[m
[31m-[m
[31m- //inserting into enrolls_to table of corresponding userid[m
[31m-          $query2="insert into enrolls_to(pid,uid,paid_date,expire,renewal) values('$plan','$memID','$cdate','$expiredate','yes')";[m
[31m-[m
[31m-[m
[31m-admin/submit_plan_new.php*******************************************[m
[31m-//Inserting data into plan table[m
[31m-    $query="insert into plan(pid,planName,description,validity,amount,active) values('$planid','$name','$desc','$planval','$amount','yes')";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/table_view.php********************************************[m
[31m-$query  = "select * from users ORDER BY joining_date";[m
[31m-[m
[31m-$uid   = $row['userid'];[m
[31m- $query1  = "select * from enrolls_to WHERE uid='$uid' AND renewal='yes'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/updateplan.php***********************************************[m
[31m-$query1="update plan set planName='".$pname."',description='".$pdesc."',validity='".$pval."',amount='".$pamt."' where pid='".$id."'";[m
[31m-[m
[31m-[m
[31m-admin/updateroitine.php************************************************[m
[31m-$query1="update timetable set day1='".$day1."',day2='".$day2."',day3='".$day3."',day4='".$day4."',day5='".$day5."',day6='".$day6."' where tid=".$id."";[m
[31m-[m
[31m-[m
[31m-admin/view_eme.php**********************************************[m
[31m-$query  = "select * from users ORDER BY joining_date";[m
[31m-[m
[31m-$query1  = "select * from enrolls_to WHERE uid='$uid' AND renewal='yes'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/view_plan.php*********************************************[m
[31m-$query  = "select * from plan where active='yes' ORDER BY amount DESC";[m
[31m-[m
[31m-[m
[31m-admin/viewall_detail.php*****************************************************[m
[31m-<h3>Edit Member Details</h3>[m
[31m-$query  = "SELECT * FROM users u [m
[31m-		INNER JOIN address a ON u.userid=a.id[m
[31m-		INNER JOIN  health_status h ON u.userid=h.uid[m
[31m-		INNER JOIN enrolls_to e on u.userid=e.uid[m
[31m-		INNER JOIN plan p on e.pid=p.pid[m
[31m-		WHERE userid='$memid' and e.renewal='yes'";[m
[31m-[m
[31m-[m
[31m-admin/viewdetailroutine.php**************************************[m
[31m-$id=$_GET['id'];[m
[31m-		$sql="Select * from sports_timetable t Where t.tid=$id";[m
[31m-[m
[31m-[m
[31m-admin/viewroutine.php***************************************[m
[31m-$query  = "select * from sports_timetable";[m
\ No newline at end of file[m
[1mdiff --git a/All sql querry in sportsclub.txt b/All sql querry in sportsclub.txt[m
[1mdeleted file mode 100644[m
[1mindex 8176e7c..0000000[m
[1m--- a/All sql querry in sportsclub.txt[m	
[1m+++ /dev/null[m
[36m@@ -1,278 +0,0 @@[m
[31m-[m
[31m-secure_login.php*******************************[m
[31m-$user_id_auth = mysqli_real_escape_string($con, $user_id_auth);[m
[31m-$pass_key     = mysqli_real_escape_string($con, $pass_key);[m
[31m-[m
[31m-$sql  = "SELECT * FROM admin WHERE username='$user_id_auth' and pass_key='$pass_key'";[m
[31m-[m
[31m-change_s_pwd.php***************************[m
[31m-$sql    = "SELECT * FROM admin WHERE username='$user_id_auth' and securekey='$key'";[m
[31m-[m
[31m-[m
[31m-admin/del_member.php*****************************[m
[31m- mysqli_query($con, "DELETE FROM users WHERE userid='$msgid'");[m
[31m-[m
[31m-admin/del_plan.php****************************[m
[31m-mysqli_query($con, "update plan set active ='no' WHERE pid='$msgid'");[m
[31m-[m
[31m-[m
[31m-admin/deleteroutine.php****************************[m
[31m-mysqli_query($con, "DELETE FROM sports_timetable WHERE tid='$msgid'");[m
[31m-[m
[31m-[m
[31m-admin/edit_mem_submit.php**************************[m
[31m- $query1="update users set username='".$uname."',gender='".$gender."',mobile='".$mobile."',email='".$email."',dob='".$dob."',joining_date='".$jdate."' where userid='".$uid."'";[m
[31m-[m
[31m-   if(mysqli_query($con,$query1))[m
[31m-   {[m
[31m-     $query2="update address set streetName='".$stname."',state='".$state."',city='".$city."',zipcode='".$zipcode."' where id='".$uid."'";[m
[31m-     if(mysqli_query($con,$query2)){[m
[31m-        $query3="update health_status set calorie='".$calorie."',height='".$height."',weight='".$weight."',fat='".$fat."',remarks='".$remarks."' where uid='".$uid."'";[m
[31m-[m
[31m-admin/edit_member.php*****************************************[m
[31m- $query  = "SELECT * FROM users u [m
[31m- 			INNER JOIN address a ON u.userid=a.id[m
[31m-			INNER JOIN  health_status h ON u.userid=h.uid[m
[31m-			WHERE userid='$memid'";[m
[31m-[m
[31m-admin/edit_plan.php*********************************************[m
[31m-$id=$_GET['id'];[m
[31m-		$sql="Select * from plan t Where t.pid=$id";[m
[31m-[m
[31m-admin/editdetailroutine.php*****************************************[m
[31m-$id=$_GET['id'];[m
[31m-		$sql="Select * from sports_timetable t Where t.tid=$id";[m
[31m-[m
[31m-admin/editroutine.php***********************************************[m
[31m-$query  = "select * from sports_timetable";[m
[31m-[m
[31m-admin/get_invoice.php*******************************************************[m
[31m-$sql = "Select * from users u INNER JOIN enrolls_to e ON u.userid=e.uid INNER JOIN plan p where p.pid=e.pid and userid='".$uid."' and e.et_id='".$etid."'";[m
[31m-	$res=mysqli_query($con, $sql);[m
[31m-	 if($res){[m
[31m-	$row=mysqli_fetch_array($res,MYSQLI_ASSOC);[m
[31m-[m
[31m-[m
[31m-admin/health_status_entry.php*****************************************************[m
[31m-$query="update health_status set calorie='".$calorie."', height='".$height."',weight='".$weight."',fat='".$fat."',remarks='".$remarks."' where uid='".$userid."'";[m
[31m-[m
[31m-$sql="select * from health_status where uid='".$uid."'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/income_month.php********************************************[m
[31m-$month=$_GET['mm'];[m
[31m-$year=$_GET['yy'];[m
[31m-[m
[31m-$query="select DISTINCT u.userid,u.username,u.gender,u.mobile,[m
[31m-u.email,u.joining_date,a.state,a.city,[m
[31m-e.paid_date,e.expire,p.planName,p.amount,p.validity from users u [m
[31m-INNER JOIN address a on u.userid=a.id [m
[31m-INNER JOIN enrolls_to e on u.userid=e.uid[m
[31m-INNER JOIN plan p on p.pid=e.pid[m
[31m-where e.paid_date  like '".$year."-".$month."___'";[m
[31m-[m
[31m-[m
[31m-admin/make_payment.php*************************************************[m
[31m-$uid  = $_POST['userID'];[m
[31m-$planid=$_POST['planID'];[m
[31m-		$query1 = "select * from users WHERE userid='$uid'";[m
[31m-$name = $row1['username'];[m
[31m-		$query2="select * from plan where pid='$planid'";[m
[31m-[m
[31m-[m
[31m-ADMIN/index.php*******************************************************************************************************[m
[31m-<h2>Paid Income This Month</h2><br>	[m
[31m-date_default_timezone_set("Asia/Calcutta"); [m
[31m-	$date  = date('Y-m');[m
[31m-	$query = "select * from enrolls_to WHERE  paid_date LIKE '$date%'";[m
[31m-[m
[31m-[m
[31m-while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {[m
[31m-	$query1="select * from plan where pid='".$row['pid']."'";[m
[31m-	$result1=mysqli_query($con,$query1);[m
[31m-[m
[31m-<h2>Total <br>Members</h2><br>[m
[31m-query = "select COUNT(*) from users";[m
[31m-[m
[31m-<h2>Joined This Month</h2><br>[m
[31m-date_default_timezone_set("Asia/Calcutta"); [m
[31m-	$date  = date('Y-m');[m
[31m-	$query = "select COUNT(*) from users WHERE joining_date LIKE '$date%'";[m
[31m-[m
[31m-<h2>Total Plan Available</h2><br>	[m
[31m-	<?php[m
[31m-	$query = "select COUNT(*) from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/make_payment.php***************************************[m
[31m-$uid  = $_POST['userID'];[m
[31m-    $planid=$_POST['planID'];[m
[31m-    $query1 = "select * from users WHERE userid='$uid'";[m
[31m-[m
[31m-$name = $row1['username'];[m
[31m-    $query2="select * from plan where pid='$planid'";[m
[31m-[m
[31m-[m
[31m-<td height="35"><select name="plan" id="boxx" required onchange="myplandetail(this.value)">[m
[31m-	<option value=""> - Please select - </option>[m
[31m-	<?php[m
[31m-	$query = "select * from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-admin/more_userprofile.php**********************************************[m
[31m-$usrname=$_POST['login_id'];[m
[31m- $fulname=$_POST['full_name'];[m
[31m- $query="update admin set username='".$usrname."',Full_name='".$fulname."' where username='".$_SESSION['full_name']."'";[m
[31m-[m
[31m-[m
[31m-admin/new 1.php*******************************************************[m
[31m-$query  = "select * from enrolls_to where renewal='yes' ORDER BY expire";[m
[31m-[m
[31m-$query1  = "select * from users WHERE userid='$uid'";[m
[31m-[m
[31m-[m
[31m-[m
[31m-admin/new_entry.php*************************************************[m
[31m-$query="select * from plan where active='yes'";[m
[31m-[m
[31m-[m
[31m-admin/new_health_status.php**********************************************[m
[31m-$query  = "select * from users ORDER BY joining_date";[m
[31m-[m
[31m- $query1  = "select * from enrolls_to WHERE uid='$uid' AND renewal='yes'";[m
[31m-[m
[31m-[m
[31m-ADMIN/new_submit.php**************************************************************************************************************[m
[31m-//inserting into users table[m
[31m-$query="insert into users(username,gender,mobile,email,dob,joining_date,userid) values('$uname','$gender','$phn','$email','$dob','$jdate','$memID')";[m
[31m-[m
[31m-//Retrieve information of plan selected by user[m
[31m-      $query1="sele