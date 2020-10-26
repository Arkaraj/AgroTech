<?php
require('top.inc.php');
isAdmin();
$order_id=get_safe_value($con,$_GET['id']);
$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value,coupon_code from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];
$coupon_code=$coupon_details['coupon_code'];
if(isset($_POST['update_order_status'])){
	$update_order_status=$_POST['update_order_status'];
	
	$update_sql='';
	if($update_order_status==3){
		$length=$_POST['length'];
		$breadth=$_POST['breadth'];
		$height=$_POST['height'];
		$weight=$_POST['weight'];
		
		$update_sql=",length='$length',breadth='$breadth',height='$height',weight='$weight' ";
		
	}
	
	if($update_order_status=='5'){
		mysqli_query($con,"update `order` set order_status='$update_order_status',payment_status='Success' where id='$order_id'");
	}else{
		mysqli_query($con,"update `order` set order_status='$update_order_status' $update_sql where id='$order_id'");
	}
	
	if($update_order_status==3){
		$token=validShipRocketToken($con);
		placeShipRocketOrder($con,$token,$order_id);
	}
	
	if($update_order_status==4){
		$ship_order=mysqli_fetch_assoc(mysqli_query($con,"select ship_order_id from `order` where id='$order_id'"));
		if($ship_order['ship_order_id']>0){
			$token=validShipRocketToken($con);
			cancelShipRocketOrder($token,$ship_order['ship_order_id']);
		}
	}
	
}
?>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Order Detail </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table">
								<thead>
									<tr>
										<th class="product-thumbnail">Product Name</th>
										<th class="product-thumbnail">Product Image</th>
										<th class="product-name">Qty</th>
										<th class="product-price">Price</th>
										<th class="product-price">Total Price</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image,`order`.address,`order`.city,`order`.pincode from order_detail,product ,`order` where order_detail.order_id='$order_id' and  order_detail.product_id=product.id GROUP by order_detail.id");
									$total_price=0;
									while($row=mysqli_fetch_assoc($res)){
									
									$userInfo=mysqli_fetch_assoc(mysqli_query($con,"select * from `order` where id='$order_id'"));
									
									$address=$userInfo['address'];
									$city=$userInfo['city'];
									$pincode=$userInfo['pincode'];
									
									$total_price=$total_price+($row['qty']*$row['price']);
									?>
									<tr>
										<td class="product-name"><?php echo $row['name']?></td>
										<td class="product-name"> <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"></td>
										<td class="product-name"><?php echo $row['qty']?></td>
										<td class="product-name"><?php echo $row['price']?></td>
										<td class="product-name"><?php echo $row['qty']*$row['price']?></td>
										
									</tr>
									<?php } 
									if($coupon_value!=''){
									?>
									<tr>
										<td colspan="3"></td>
										<td class="product-name">Coupon Value</td>
										<td class="product-name">
										<?php 
										echo $coupon_value."($coupon_code)";
										?></td>
										
									</tr>
									<?php } ?>
									<tr>
										<td colspan="3"></td>
										<td class="product-name">Total Price</td>
										<td class="product-name"><?php 
												echo $total_price-$coupon_value;
												?></td>
										
									</tr>
								</tbody>
							
						</table>
						<div id="address_details">
							<strong>Address</strong>
							<?php echo $address?>, <?php echo $city?>, <?php echo $pincode?><br/><br/>
							<strong>Order Status</strong>
							<?php 
							$order_status_arr=mysqli_fetch_assoc(mysqli_query($con,"select order_status.name,order_status.id as order_status from order_status,`order` where `order`.id='$order_id' and `order`.order_status=order_status.id"));
							echo $order_status_arr['name'];
							?>
							
							<div>
								<form method="post">
									<select class="form-control" name="update_order_status" id="update_order_status" required onchange="select_status()">
										<option value="">Select Status</option>
										<?php
										$res=mysqli_query($con,"select * from order_status");
										while($row=mysqli_fetch_assoc($res)){
											echo "<option value=".$row['id'].">".$row['name']."</option>";
										}
										?>
									</select>
									<div id="shipped_box" style="display:none">
										<table>
											<tr>
												<td><input type="text" class="form-control" name="length" placeholder="length"/></td>
												<td><input type="text" class="form-control" name="breadth" placeholder="Breadth"/></td>
												<td><input type="text" class="form-control" name="height" placeholder="height"/></td>
												<td><input type="text" class="form-control" name="weight" placeholder="weight"/></td>
											</tr>
										</table>
									</div>
									<input type="submit" class="form-control"/>
								</form>
							</div>
						</div>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>
<script>
function select_status(){
	var update_order_status=jQuery('#update_order_status').val();
	if(update_order_status==3){
		jQuery('#shipped_box').show();
	}
}
</script>
<?php
require('footer.inc.php');
?>