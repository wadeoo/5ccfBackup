
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>用户 | 预定手术</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		
	</head>
	<body style="background-image:url(images/slider-image2.jpg)">
		<div id="app">		
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">用户 | 预定手术</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span>User</span>
									</li>
									<li class="active">
										<span>预定手术</span>
									
									</li>
									
									
								</ol>
								
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-md-12">
									
									<div class="row margin-top-30">
										<div class="col-lg-8 col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">预定手术</h5>
												</div>
												<div class="panel-body">
													<form method="post" action="successbapn.jsp?pname=123">
													
<div class="form-group">
															<label for="DoctorSpecialization">
																医生科类
															</label>
							<select name="dspec" class="form-control" required="required">
																<option value="">选择科类</option>
																<option value="脑部手术">脑部手术</option>
																<option value="心脏手术">心脏手术</option>
																<option value="整形手术">整形手术</option>
																<option value="癌症治疗">癌症治疗</option>
																
																<option value="基础治疗">基础治疗</option>
															</select>
														</div>

														<div class="form-group">
															<label for="doctor">
																医生
															</label>
						<select name="dname" class="form-control" required="required">
							
						<option value="">选择医生</option>
						<option value="医生1">医生1</option>
						<option value="医生2">医生2</option>
					
						</select>
														</div>

														
<div class="form-group">
															<label for="AppointmentDate">
																日期
															</label>
<input class="form-control datepicker" name="date"  required="required" data-date-format="yyyy-mm-dd"><b>格式: YYYY-MM-DD</b>
	
														</div>
														
<div class="form-group">
															<label for="Appointmenttime">
														
														时间
													
															</label>
			<input class="form-control" name="time" id="timepicker1" required="required"><b>格式: HH:MM:SS （24小时制）</b>
														</div>														
														
														<button type="submit" name="submit" class="btn btn-o btn-dark">
															提交
														</button>
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
			</div>
	
	</body>
</html>
