<?php
	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');

	if (!isset($_SESSION['username']))
	{
		$smarty->display('common/notFound.tpl');
	}
	else
	{
        try
        {
            $user = getUserInfoByUsername($_SESSION['username']);

            //personal info

            $str = $user['cpostal'];
            $str = explode("-", $str);

            $user['cpostal1'] = $str[0];
            $user['cpostal2'] = $str[1];

            $smarty->assign('user', $user);
            $smarty->display('users/profile.tpl');
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }
	}



?>
