<?php
session_start();
ini_set('memory_limit', '-1');
include('system/config/directory.php');
$fdenial = false;
/*$ip = $_SERVER['REMOTE_ADDR'];
if(isset($_SESSION['access']))
{
    if( time() - $_SESSION['access'] < 1 )
    {

        unset($_SESSION['access']);
        //header("Location: ".HTTP_SERVER."denial.php");
        $fdenial = true;
    }

}

$_SESSION['access'] = time();*/
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);

if (!$fdenial) {
    include('system/config/config.php');
    include('system/config/startup.php');

    // Front Controller
    $controller = new Front();

    // Router
    if (isset($request->get['route'])) {
        $action = new Router($request->get['route']);
    } else {
        $action = new Action('page/home', 'index');
    }

    // Dispatch
    $controller->dispatch($action, new Action('error/not_found', 'index'));

    // Output
    $response->output();
}
?>