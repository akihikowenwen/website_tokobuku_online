<?php 
	include"../inc/config.php"; 
	validate_admin_not_login("login.php");
	
	
	if(!empty($_GET)){
		if($_GET['act'] == 'delete'){
			
			$q = mysql_query("delete from penerbit WHERE id='$_GET[id]'");
			if($q){ alert("Success"); redir("penerbit.php"); }
		}  
	}
	if(!empty($_GET['act']) && $_GET['act'] == 'create'){
		if(!empty($_POST)){
			extract($_POST);
			$q = mysql_query("insert into penerbit Values(NULL,'$nama')");
			if($q){ 
				alert("Success"); redir("penerbit.php");
			}
		}
	}
	if(!empty($_GET['act']) && $_GET['act'] == 'edit'){
		if(!empty($_POST)){ 
			extract($_POST);
			$q = mysql_query("update penerbit SET nama='$nama' where id=$_GET[id]") or die(mysql_error());
			if($q){
				alert("Success"); redir("penerbit.php");
			}
		}
	}
	
	
	include"inc/header.php";
	
?> 
	
	<div class="container">
		<?php
			$q = mysql_query("select*from penerbit");
			$j = mysql_num_rows($q);
		?>
		<h4>Daftar Penerbit (<?php echo ($j>0)?$j:0; ?>)</h4>
		<a class="btn btn-sm btn-primary" href="penerbit.php?act=create">Add Data</a>
		<hr>
		<?php
			if(!empty($_GET)){
				if($_GET['act'] == 'create'){
				?>
					<div class="row col-md-6">
					<form action="" method="post">
						<label>Nama</label><br>
						<input type="text" class="form-control" name="nama" required><br>
						<input type="submit" name="form-input" value="Simpan" class="btn btn-success">
					</form>
					</div>
					<div class="row col-md-12"><hr></div>
				<?php	
				} 
				if($_GET['act'] == 'edit'){
					$data = mysql_fetch_object(mysql_query("select*from penerbit where id='$_GET[id]'"));
				?>
					<div class="row col-md-6">
					<form action="penerbit.php?act=edit&id=<?php echo $_GET['id'] ?>" method="post" enctype="multipart/form-data">
						<label>Nama</label><br>
						<input type="text" class="form-control" name="nama" value="<?php echo $data->nama; ?>"><br>
						<input type="submit" name="form-edit" value="Simpan" class="btn btn-success">
					</form>
					</div>
					<div class="row col-md-12"><hr></div>
				<?php
				} 
			}
		?>
		
		<table class="table table-striped table-hover">
			<thead> 
				<tr> 
					<th>#</th> 
					<th>Nama</th> 
					<th>*</th> 
				</tr> 
			</thead> 
			<tbody> 
				

			
			
		<?php while($data=mysql_fetch_object($q)){ ?> 
				<tr> 
					<th scope="row"><?php echo $no++; ?></th> 
					<td><?php echo $data->nama ?></td> 
					<td>
						<a class="btn btn-sm btn-success" href="penerbit.php?act=edit&&id=<?php echo $data->id ?>">Edit</a>
						<a class="btn btn-sm btn-danger" href="penerbit.php?act=delete&&id=<?php echo $data->id ?>">Delete</a>
					</td> 
				</tr>
		<?php } ?>
			</tbody> 
		</table> 
    </div> <!-- /container -->
	
<?php include"inc/footer.php"; ?>