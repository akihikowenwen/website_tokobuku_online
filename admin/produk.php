<?php 
	include"../inc/config.php"; 
	// validate_admin_not_login("login.php");
	
	// delete
	if(!empty($_GET)){
		if($_GET['act'] == 'delete'){
			
			$q = mysql_query("delete from produk WHERE id='$_GET[id]'");
			if($q){ alert("Success"); redir("produk.php"); }
		}  
	}
	if(!empty($_GET['act']) && $_GET['act'] == 'create'){
		if(!empty($_POST)){
			$gambar = md5('Y-m-d H:i:s').$_FILES['gambar']['name'];
			extract($_POST);
			$deskripsi = (!empty($_POST['deskripsi'])) ? $_POST['deskripsi'] : NULL;
			$q = mysql_query("insert into produk Values(NULL,'$nama','$deskripsi','$gambar','$jumlah','$harga','$kategori_produk_id','$penerbit_id','$penulis_id')");
			if($q){
				$upload = move_uploaded_file($_FILES['gambar']['tmp_name'], '../uploads/'.$gambar);
				if($upload){ alert("Success"); redir("produk.php"); }
			}
		}
	}
	if(!empty($_GET['act']) && $_GET['act'] == 'edit'){
		if(!empty($_POST)){ 
			
			$gambar = md5('Y-m-d H:i:s').$_FILES['gambar']['name'];
			extract($_POST); 
			$deskripsi = (!empty($_POST['deskripsi'])) ? $_POST['deskripsi'] : NULL; 
		
			$q = mysql_query("update produk SET nama='$nama',deskripsi='$deskripsi', gambar='$gambar', jumlah='$jumlah', harga='$harga', kategori_produk_id='$kategori_produk_id',penerbit_id='$penerbit_id',penulis_id='$penulis_id' where id=$_GET[id]") or die(mysql_error());
			if($q){
				$upload = move_uploaded_file($_FILES['gambar']['tmp_name'], '../uploads/'.$gambar);
				if($upload){ alert("Success"); redir("produk.php"); }
			}
		}
	}
	
	
	include"inc/header.php";
	
?> 
	
	<div class="container">
		<?php
			$q = mysql_query("select*from produk");
			$j = mysql_num_rows($q);
		?>
		<h4>Daftar Produk (<?php echo ($j>0)?$j:0; ?>)</h4>
		<a class="btn btn-sm btn-primary" href="produk.php?act=create">Add Data</a>
		<hr>
		<?php
			if(!empty($_GET)){
				if($_GET['act'] == 'create'){
				?>
					<div class="row col-md-6">
					<form action="" method="post" enctype="multipart/form-data">
						<label>Kategori Produk</label><br>
						<select name="kategori_produk_id" required class="form-control"> 
							<?php
								$katpro = mysql_query("select*from kategori_produk");
								while($kp = mysql_fetch_array($katpro)){
							?>
							<option value="<?php echo $kp['id']; ?>"><?php echo $kp['nama'] ?></option>
								<?php } ?>
						</select><br>
						<label>Nama</label><br>
						<input type="text" class="form-control" name="nama" required><br>
						<label>Deskripsi</label><br> 
						<textarea class="form-control" name="deskripsi" required></textarea><br>
						<label>Penerbit</label><br>
						<select name="penerbit_id" required class="form-control"> 
							<?php
								$penbit = mysql_query("select*from penerbit");
								while($pb = mysql_fetch_array($penbit)){
							?>
							<option value="<?php echo $pb['id']; ?>"><?php echo $pb['nama'] ?></option>
								<?php } ?>
						</select><br>
						<label>Penulis</label><br>
						<select name="penulis_id" required class="form-control"> 
							<?php
								$penlis = mysql_query("select*from penulis");
								while($pn = mysql_fetch_array($penlis)){
							?>
							<option value="<?php echo $pn['id']; ?>"><?php echo $pn['nama'] ?></option>
								<?php } ?>
						</select><br>
						<label>Gambar</label><br>
						<input type="file" class="form-control" name="gambar" required><br>
						<label>Jumlah</label><br>
						<input type="number" class="form-control" name="jumlah" required><br>
						<label>Harga</label><br>
						<input type="number" class="form-control" name="harga" required><br>
						<input type="submit" name="form-input" value="Simpan" class="btn btn-success">
					</form>
					</div>
					<div class="row col-md-12"><hr></div>
				<?php	
				} 
				if($_GET['act'] == 'edit'){
					$data = mysql_fetch_object(mysql_query("select*from produk where id='$_GET[id]'"));
				?>
					<div class="row col-md-6">
					<form action="produk.php?act=edit&&id=<?php echo $_GET['id'] ?>" method="post" enctype="multipart/form-data">
						<label>Kategori Produk</label><br>
						<select name="kategori_produk_id" required class="form-control"> 
						<?php
								$katpro = mysql_query("select*from kategori_produk where id='$data->kategori_produk_id'");
								$kpa = mysql_fetch_array($katpro);
							?>
								<option value="<?php echo $kpa['id']; ?>"><?php echo $kpa['nama'] ?></option>
							<?php
								$katpro = mysql_query("select*from kategori_produk");
								while($kp = mysql_fetch_array($katpro)){
							?>
								<option value="<?php echo $kp['id']; ?>"><?php echo $kp['nama'] ?></option>
								<?php } ?>
						</select><br>
						<label>Nama</label><br>
						<input type="text" class="form-control" name="nama" value="<?php echo $data->nama; ?>"><br>
						<label>Deskripsi</label><br> 
						<textarea class="form-control" name="deskripsi" required><?php echo $data->deskripsi; ?></textarea><br>
						<label>Penerbit</label><br>
						<select name="penerbit_id" required class="form-control"> 
						<?php
								$penbit = mysql_query("select*from penerbit where id='$data->penerbit_id'");
								$pba = mysql_fetch_array($penbit);
							?>
								<option value="<?php echo $pba['id']; ?>"><?php echo $pba['nama'] ?></option>
							<?php
								$penbit = mysql_query("select*from penerbit");
								while($pb = mysql_fetch_array($penbit)){
							?>
								<option value="<?php echo $pb['id']; ?>"><?php echo $pb['nama'] ?></option>
								<?php } ?>
						
						</select><br>
						<label>Penulis</label><br>
						<select name="penulis_id" required class="form-control"> 
						<?php
								$penlis = mysql_query("select*from penulis where id='$data->penulis_id'");
								$pna = mysql_fetch_array($penlis);
							?>
								<option value="<?php echo $pna['id']; ?>"><?php echo $pna['nama'] ?></option>
							<?php
								$penlis = mysql_query("select*from penulis");
								while($pn = mysql_fetch_array($penlis)){
							?>
								<option value="<?php echo $pn['id']; ?>"><?php echo $pn['nama'] ?></option>
								<?php } ?>
						
						</select><br>
						
						<label>Gambar</label><br>
						<input type="file" class="form-control" name="gambar" required><br>
						<label>Jumlah</label><br>
						<input type="number" class="form-control" name="jumlah" required value="<?php echo $data->jumlah; ?>"><br>
						<label>Harga</label><br>
						<input type="number" class="form-control" name="harga" required value="<?php echo $data->harga; ?>"><br>
						<input type="submit" name="form-edit" value="Simpan" class="btn btn-success">
					</form>
					</div>
					<div class="row col-md-12"><hr></div>
				<?php	
				} 
			}
		?>
		
		<table class="table table-striped table-hove"> 
			<thead> 
				<tr> 
					<th>#</th> 
					<th width="70px">Gambar</th> 
					<th>Nama</th> 
					<th>kategoi</th>
					<th>Deskripsi</th>
					<th>Penerbit</th>
					<th>Penulis</th>
					<th>Jumlah</th>
					<th>harga</th> 
					<th>*</th> 
				</tr> 
			</thead> 
			<tbody> 
				

			
			
		<?php while($data=mysql_fetch_object($q)){ ?> 
				<tr> 
					<th scope="row"><?php echo $no++; ?></th> 
					<td><img src="<?php echo $url.'uploads/'.$data->gambar ?>" width="100%"></td> 
					<td><?php echo $data->nama ?></td> 
					<td><?php echo $data->kategori_produk_id?></td>
					<td><?php echo $data->deskripsi?></td>
					<td><?php echo $data->penerbit_id?></td>
					<td><?php echo $data->penulis_id?></td>
					<td><?php echo number_format($data->jumlah, 2, ',', '.') ?></td>
					<td><?php echo number_format($data->harga, 2, ',', '.') ?></td> 
					<td>
						<a class="btn btn-sm btn-success" href="produk.php?act=edit&&id=<?php echo $data->id ?>">Edit</a>
						<a class="btn btn-sm btn-danger" href="produk.php?act=delete&&id=<?php echo $data->id ?>">Delete</a>
					</td> 
				</tr>
		<?php } ?>
			</tbody> 
		</table> 
    </div> <!-- /container -->
	
<!-- <?php include"inc/footer.php"; ?> -->