<?php 
	include"inc/config.php";
	include"layout/header.php";
	
	
?>
<?php	if(!empty($_GET['id'])){ ?>
		<?php
			extract($_GET); 
			$k = mysql_query("SELECT * FROM produk where id='$id'"); 
			$data = mysql_fetch_array($k);
		?>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
							<div class="col-md-6">
							
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
								
								<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%"> 
							</a>
							<br><br>
						</div>
						<div class="col-md-6">
						<ul>
										<h3><?php echo $data['nama'] ?></h3>
                                        <hr>
										
										<p>Penerbit :<?php echo $data['penerbit']?></p>
                                        <hr>
										<p>penulis : <?php echo $data['penulis'] ?></p>
                                        <hr>
										<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
                                        <hr>
                                        <p>Stok : <?php echo $data['jumlah'] ?></p>
                                        <hr>
                                        <h3>Deskripsi</h3>
                                        <p><?php echo $data['deskripsi'] ?></p>
                                        <p>
										<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
									View
								</button>
								<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info" href="#" role="button">Pesan</a>
							</p>
            
                                        <hr>
                                        </ul>
						</div>
                                <div class="modal-footer"></div>
                            </div>
                        </div>
                    </div>
                </div>
		<div class="col-md-9">
			<div class="row">
			<div class="col-md-12">
			
				<br/>
				<div class="col-md-12 content-menu" style="margin-top:-20px;">
				<?php $kat = mysql_fetch_array(mysql_query("SELECT * FROM kategori_produk where id='$data[kategori_produk_id]'"));  ?>
					<div class="row">
						<div class="col-md-6">
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
								
								<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%"> 
							</a>
							<br><br>
						</div>
						<div class="col-md-6">
						<ul>
										<h3><?php echo $data['nama'] ?></h3>
                                        <hr>
										
										<p>Penerbit :<?php echo $data['penerbit']?></p>
                                        <hr>
										<p>penulis : <?php echo $data['penulis'] ?></p>
                                        <hr>
										<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
                                        <hr>
                                        <p>Stok : <?php echo $data['jumlah'] ?></p>
                                        <hr>
                                        <h3>Deskripsi</h3>
                                        <p><?php echo $data['deskripsi'] ?></p>
                                        <p>
										<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
									View
								</button>
								<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info" href="#" role="button">Pesan</a>
							</p>
            
                                        <hr>
                                        </ul>
						</div>
					</div>
					
					
				</div>   
				 
					
				
			</div>
			</div> 
		</div>
		
<?php }elseif(!empty($_GET['kategori'])){ ?>	

		<?php
			extract($_GET); 
			$kat = mysql_fetch_array(mysql_query("SELECT * FROM kategori_produk where id='$kategori'")); 
		?>
		<div class="col-md-9">
			<div class="row">
			<div class="col-md-12">
			<hr>
			<h3>Kategori : <?php echo $kat['nama'] ?></h3>
				<?php 
					$k = mysql_query("SELECT * FROM produk where kategori_produk_id='$kategori'");
					while($data = mysql_fetch_array($k)){
				?>
				<div class="col-md-4 content-menu">
					<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
						<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
						<h4><?php echo $data['nama'] ?></h4>
					</a>
					<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
					<p>
					<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
									View
								</button>
						<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
						<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
					</p>
				</div>  
				<?php } ?>
				
			</div>
			</div>
		</div>

<?php }else{ ?>	
			
			<div class="col-md-9">
			<div class="row">
			<div class="col-md-12">
			<hr>
			<h3>Daftar Semua Menu</h3>
			
			
				<?php 
					$k = mysql_query("SELECT * FROM produk");
					while($data = mysql_fetch_array($k)){
				?>
				
				<div class="col-md-4 content-menu">
				
					<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
						<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
						<h4><?php echo $data['nama'] ?></h4>
					</a>
					<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
					<p>
					<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
									View
			
								</button>
						<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
						<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
					</p>
					
				</div>  
				<?php } ?>
				
			</div>
			</div>
		</div>

<?php } ?>

<?php include"layout/footer.php"; ?>