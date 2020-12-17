<?php
session_start();
#Local connections


#Remote connection
$con=mysqli_connect("","","","");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/Agrotech');
define('SITE_PATH','https://agro-tech.herokuapp.com/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'/media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'/media/product/');
?>