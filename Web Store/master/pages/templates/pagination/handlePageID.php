<?php
    if (!isset($_GET['page']))
        $page_index = 1;
    else
        $page_index = trim($_GET['page']);