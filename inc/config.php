<?php 
	session_start();
	mysql_connect("localhost", "root", "");
	mysql_select_db("books_store_db");
	
	// settings
	$url = "http://localhost/catering/";
	$title = "Toko Buku";
	$no = 1;
	
	function alert($command){
		echo "<script>alert('".$command."');</script>";
	}
	function redir($command){
		echo "<script>document.location='".$command."';</script>";
	}
	function validate_admin_not_login($command){
		if(empty($_SESSION['iam_admin'])){
			redir($command);
		}
	}
?>r