<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR . 'database/admin.php');

  $reviews = getAllReviews();
  $smarty->assign('reviews', $reviews);
  $smarty->display('admin/adminReviews.tpl');
?>
