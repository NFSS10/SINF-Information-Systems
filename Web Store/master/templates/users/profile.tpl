{include file='common/header.tpl'}
<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/profile.css">
<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/my_orders.css">

<script src="{$BASE_URL}javascript/profile.js"></script>

<div class="container" id="profile_container">
	<div class="breadcrumb_container">
		<ul class="breadcrumb">
			<li><a href="#">My account</a></li>
			<li class="active">Account details</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-2 col-sm-4 sidebar1">
			<div class="account_panel_header">
				<h2><strong>My Account</strong></h2>
			</div>
			<br>
			<div class="left-navigation">
				<ul class="my_account_list">
					<li><a href="#">Account details</a></li>
					<li><a href="{$BASE_URL}pages/users/my_orders.php">Purchases</a></li>
					<li><a href="{$BASE_URL}pages/users/favorites.php">Wish list</a></li>
				</ul>
			</div>
		</div>
				<div class="col-md-6 col-sm-6 user_detail_info_table">
					<div class="card">
						<div class="card-header">
							<strong>Personal Details</strong>
                            <a id="p_edit_error" data-toggle="popover" data-trigger="hover" data-html="true" data-placement="right"
                               data-content="<span class='pop_over_name'>1. Name must contain at least 3 letters.<br /></span>
                               <span class='pop_over_bday'>2. You must have at least 18 years.<br /></span>">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
							<a href="#" id="user_info_edit"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
						</div>
						<div class="card-block">
							<div class="row p_detail_item p_pi_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Name:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8 pi_name">
                                    {$user.nome}
								</div>
							</div>
							<div class="form-group row p_pi_form_item">
								<label class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Name:</strong></span>
								</label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="p_edit_name" type="text" value="{$user.nome}" name="name">
								</div>
							</div>
							<div class="row p_detail_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Email:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.email}
								</div>
							</div>
							<div class="row p_detail_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>NIF:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.nif}
								</div>
							</div>
							<div class="row p_detail_item p_pi_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Birthday Date:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8" >
                                    {$user.datanascimento}
								</div>
							</div>
							<div class="form-group row p_pi_form_item p_form_item">
								<label class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Birthday Date:</strong></span>
								</label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="p_edit_bday" type="date" value="{$user.datanascimento}" name="birthday">
								</div>
							</div>
							<div class="row p_detail_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Registration Date:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.dataregisto}
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 user_detail_info_table">
					<div class="card">
						<div class="card-header">
							<strong>Shipping Details</strong>
                            <a id="p_edit_error2" data-toggle="popover" data-trigger="hover" data-html="true" data-placement="right"
                               data-content="<span class='pop_over_address'>1. Address must contain at least 5 characters.<br /></span>
                                             <span class='pop_over_town'>2. Town must contain at least 5 characters.<br /></span>
                                           <span class='pop_over_pcode'>3. Postal Code format: 4 digits - 3 digits.<br /></span>">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
							<span id="user_shipping_info_edit"> <i class="fa fa-pencil" aria-hidden="true"></i></span>
						</div>
						<div class="card-block">
							<div class="row p_detail_item p_shipi_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Address:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.morada}
								</div>
							</div>
                            <div class="form-group row p_form_item p_shipi_form_item">
                                <label class="col-md-4 col-sm-4">
                                    <span class="p_name"><strong>Address:</strong></span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <input class="form-control" id="p_edit_address" type="text" value="{$user.morada}" name="address">
                                </div>
                            </div>
							<div class="row p_detail_item p_shipi_item">
								<div class="col-md-4 col-sm-4">
									<span class="p_name"><strong>Town:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.localidade}
								</div>
							</div>
                            <div class="form-group row p_form_item p_shipi_form_item">
                                <label class="col-md-4 col-sm-4">
                                    <span class="p_name"><strong>Town:</strong></span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <input class="form-control" id="p_edit_town" type="text" value="{$user.localidade}" name="address">
                                </div>
                            </div>
							<div class="row p_detail_item p_shipi_item">
								<div class="col-md-4 col-sm-4 ">
									<span class="p_name"><strong>Postal Code:</strong></span>
								</div>
								<div class="col-md-8 col-sm-8">
                                    {$user.cpostal}
								</div>
							</div>
                            <div class="form-group row p_form_item p_shipi_form_item">
                                <label class="col-md-4 col-sm-4">
                                    <span class="p_name"><strong>Postal Code:</strong></span>
                                </label>
                                <div class="col-md-4 col-sm-4 pcode1">
                                    <input class="form-control" id="p_edit_pcode1" type="number" name="pcode1"  value="{$user.cpostal1}">
                                </div>
                                <div class="col-md-3 col-sm-3 pcode2">
                                    <input class="form-control" id="p_edit_pcode2" type="number" name="pcode2" value="{$user.cpostal2}">
                                </div>
                            </div>
						</div>
					</div>
				</div>
		</div>
    <div class="row" id="profile_edit_buttons">
        <div class="col-md-10 offset-md-2" style="text-align:center">

            <button type="button" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-success"><i class="fa fa-check save" aria-hidden="true"></i>Save Changes</button>
        </div>
    </div>

	</div>

{include file='common/footer.tpl'}