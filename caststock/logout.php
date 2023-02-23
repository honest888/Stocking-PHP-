<?php
unset($_SESSION['user']);
unset($_SESSION['stocking_action']);
header('Location: ./index.php');
