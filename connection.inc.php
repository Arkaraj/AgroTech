<?php
session_start();
$con=mysqli_connect("localhost","root","Arceus373","Ecom");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/Agrotech');
define('SITE_PATH','http://localhost/Agrotech/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'/media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'/media/product/');
?>