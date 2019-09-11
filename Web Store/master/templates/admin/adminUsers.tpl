{include file='common/header.tpl'}

<link href="{$BASE_URL}css/adminUsers.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>

<div class="container-fluid" id="all-content">
    <div class="row">
        <div class="col-md-3" id="sideBar">
            {include file='admin/adminSidebar.tpl'}
        </div>
        <div class="col-md-9">
            <div class="row" id="graphs">
                <div class="col-lg-12">
					<br><br>
                    <h2>Utilizadores</h2>
                    <hr class="half-rule-usersRecentes"/>
                </div>   
            </div>
				<div class="content" id="table">
					<table id="usersTable" class="display responsive " width="100%">
						<thead>
							<tr>
								<th></th>
								<th>Username</th>
								<th>Email</th>
								<th>Nome</th>
								<th>Nif</th>
							</tr>
						</thead>
						<tbody>
							{foreach $users as $user}
							<tr>
								<td></td>
								<td>{$user['username']}</td>
								<td>{$user['email']}</td>
								<td>{$user['nome']}</td>
								<td>{$user['nif']}</td>
							</tr>
							{/foreach}
						</tbody>
					</table>   
				</div>
            <br> <br> <br>
            <br> <br>
        </div>
    </div>
</div>
<script>
	$(document).ready(function() {
    $('#usersTable').DataTable( {
        responsive: {
            details: {
                type: 'column'
            }
        },
        columnDefs: [ {
            className: 'control',
            orderable: false,
            targets:   0
        } ],
        order: [ 1, 'asc' ]
    } );
} );

</script>
{include file='common/footer.tpl'}
