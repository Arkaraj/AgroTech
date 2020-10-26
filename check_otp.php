<?php
require('connection.inc.php');
require('functions.inc.php');

$type=get_safe_value($con,$_POST['type']);
$otp=get_safe_value($con,$_POST['otp']);
if($type=='email'){
	if($otp==$_SESSION['EMAIL_OTP']){
		unset($_SESSION['EMAIL_OTP']);
		echo "done";
	}else{
		echo "no";
	}
}

if($type=='mobile'){
	if($otp==$_SESSION['MOBILE_OTP']){
		unset($_SESSION['MOBILE_OTP']);
		echo "done";
	}else{
		echo "no";
	}
}
?>