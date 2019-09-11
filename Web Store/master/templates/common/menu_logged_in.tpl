<span class="dropdown">
    <button class="btn dropdown-toggle hi_text" type="button" id="my_account" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fa fa-user" aria-hidden="true"> </i> Hi {$USERNAME}
    </button>
    <div class="dropdown-menu dropdown-login" aria-labelledby="my_account">
        <a class="dropdown-item dropdown-item-login" href="{$BASE_URL}pages/users/my_orders.php">My orders</a>
        <a class="dropdown-item dropdown-item-login" href="{$BASE_URL}pages/users/favorites.php">My favorites</a>
        <a class="dropdown-item dropdown-item-login" href="{$BASE_URL}pages/users/profile.php">Profile</a>
        {if $ADMIN}
            <a class="dropdown-item dropdown-item-login" href="{$BASE_URL}pages/admin/adminDashboard.php">Dashboard</a>
        {/if}
        <div class="dropdown-divider dropdown-item-login-dividir"></div>
        <a class="dropdown-item dropdown-item-login" href="{$BASE_URL}actions/users/logout.php">Logout</a>
    </div>
</span>