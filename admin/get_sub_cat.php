<?php
require('connection.inc.php');
require('functions.inc.php');
if(isset($_SESSION['ADMIN_LOGIN']) && $_SESSION['ADMIN_LOGIN']!=''){

}else{
	header('location:login.php');
	die();
}
$categories_id=get_safe_value($con,$_POST['categories_id']);
$sub_cat_id=get_safe_value($con,$_POST['sub_cat_id']);
$res=mysqli_query($con,"select * from sub_categories where categories_id='$categories_id' and status='1'");
if(mysqli_num_rows($res)>0){
	$html='';
	while($row=mysqli_fetch_assoc($res)){
		if($sub_cat_id==$row['id']){
			$html.="<option value=".$row['id']." selected>".$row['sub_categories']."</option>";
		}else{
			$html.="<option value=".$row['id'].">".$row['sub_categories']."</option>";
		}
	}
	echo $html;
}else{
	echo "<option value=''>No sub categories found</option>";
}
?>