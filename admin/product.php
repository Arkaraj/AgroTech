<?php
require('top.inc.php');

$condition='';
$condition1='';
if($_SESSION['ADMIN_ROLE']==1){
	$condition=" and product.added_by='".$_SESSION['ADMIN_ID']."'";
	$condition1=" and added_by='".$_SESSION['ADMIN_ID']."'";
}

if(isset($_GET['type']) && $_GET['type']!=''){
	$type=get_safe_value($con,$_GET['type']);
	if($type=='status'){
		$operation=get_safe_value($con,$_GET['operation']);
		$id=get_safe_value($con,$_GET['id']);
		if($operation=='active'){
			$status='1';
		}else{
			$status='0';
		}
		$update_status_sql="update product set status='$status' $condition1 where id='$id'";
		mysqli_query($con,$update_status_sql);
	}
	
	if($type=='delete'){
		$id=get_safe_value($con,$_GET['id']);
		$delete_sql="delete from product where id='$id' $condition1";
		mysqli_query($con,$delete_sql);
	}
}
$sql="select product.*,categories.categories from product,categories where product.categories_id=categories.id $condition order by product.id desc";

if(isset($_GET['str']) && $_GET['str'] !=''){
	$str=mysqli_real_escape_string($con,$_GET['str']);
	
	$sql="select product.*,categories.categories from product,categories where product.categories_id=categories.id $condition and (product.name like '%$str%' or product.description like '%$str%') order by product.id desc";
}

$res=mysqli_query($con,$sql);
$check_val=mysqli_num_rows($res);
?>
<style>
.d-flex {
	margin-bottom: 5px;
    width: 25%;
	margin-left: 73%;
}
.form-control{
	border: none;
	border-bottom: 1.5px solid #17a2b8;
    border-radius: 0px;
	margin-right: 10px;
	outline: 0;
}
.form-control:focus{
	box-shadow: none;
}
#move{
	margin-left:20%;
}
</style>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Products </h4>
				   <h4 class="box-link"><a href="manage_product.php">Add Product</a> </h4>
				</div>
				<!-- Search form -->
				<div class="d-flex">
        <input class="form-control me-2" type="search" id="names" placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-info" id="btn" name="str" onclick="search('<?php echo SITE_PATH?>')"><i class="fas fa-search" aria-hidden="true"></i></button>
      </div>
	  <!-- End of Search form -->
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">#</th>
							   <th width="2%">ID</th>
							   <th width="10%">Categories</th>
							   <th width="30%">Name</th>
							   <th width="10%">Image</th>
							   <th width="10%">MRP</th>
							   <th width="7%">Price</th>
							   <th width="7%">Qty</th>
							   <th width="26%"></th>
							</tr>
						 </thead>
						 <tbody>
							<?php 
							$i=1;
							if($check_val > 0) {
							while($row=mysqli_fetch_assoc($res)){?>
							<tr>
							   <td class="serial"><?php echo $i?></td>
							   <td><?php echo $row['id']?></td>
							   <td><?php echo $row['categories']?></td>
							   <td><?php echo $row['name']?></td>
							   <td><img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"/></td>
							   <td><?php echo $row['mrp']?></td>
							   <td><?php echo $row['price']?></td>
							   <td><?php echo $row['qty']?><br/>
							   <?php
							   $productSoldQtyByProductId=productSoldQtyByProductId($con,$row['id']);
							   $pneding_qty=$row['qty']-$productSoldQtyByProductId;
							   
							   ?>
							   Pending Qty <?php echo $pneding_qty?>
							   
							   </td>
							   <td>
								<?php
								if($row['status']==1){
									echo "<span class='badge badge-complete'><a href='?type=status&operation=deactive&id=".$row['id']."'>Active</a></span>&nbsp;";
								}else{
									echo "<span class='badge badge-pending'><a href='?type=status&operation=active&id=".$row['id']."'>Deactive</a></span>&nbsp;";
								}
								echo "<span class='badge badge-edit'><a href='manage_product.php?id=".$row['id']."'>Edit</a></span>&nbsp;";
								
								echo "<span class='badge badge-delete'><a href='?type=delete&id=".$row['id']."'>Delete</a></span>";
								
								?>
							   </td>
							</tr>
							<?php 
							} ?>
						 </tbody>
						 <?php }else{
								echo "<h2 id='move'>Data not found</h2>";
							 }?>
					  </table>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>
<script>
function search(site_path) {
	var search_product_id = jQuery('#names').val();
	window.location.href = site_path + "admin/product.php?str=" + search_product_id;
}
</script>
<?php
require('footer.inc.php');
?>