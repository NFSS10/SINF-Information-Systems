<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/adminSidebar.css">

<div class="nav-side-menu" id="admin-side">
    <div class="brand">Admin Menu</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out">
            <li><a href="{$BASE_URL}pages/admin/adminDashboard.php"><i class="fa fa-dashboard fa-lg"></i> Dashboard</a></li>
            <li><a href="{$BASE_URL}pages/admin/adminUsers.php"><i class="fa fa-users fa-lg"></i> Users</a></li>
            <li><a href="{$BASE_URL}pages/admin/adminReviews.php"><i class="fa fa-user fa-lg"></i> Reviews </a></li>
            <li><a href="{$BASE_URL}cron/syncronize_database_admin.php"><i class="fa fa-refresh fa-lg"></i> Update Database</a></li>
        </ul>
    </div>
</div>