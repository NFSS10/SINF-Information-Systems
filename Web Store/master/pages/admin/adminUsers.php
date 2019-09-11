<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR . 'database/admin.php');

  $users = getAllUsers();
  $smarty->assign('users', $users);
  $smarty->display('admin/adminUsers.tpl');
?>
