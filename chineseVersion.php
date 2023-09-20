<?php
  
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
// Copyright (C) 2007  Phorum Development Team                               //
// http://www.phorum.org                                                     //
//                                                                           //
// This program is free software. You can redistribute it and/or modify      //
// it under the terms of either the current Phorum License (viewable at      //
// phorum.org) or the Phorum License that was distributed with this file     //
//                                                                           //
// This program is distributed in the hope that it will be useful,           //
// but WITHOUT ANY WARRANTY, without even the implied warranty of            //
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                      //
//                                                                           //
// You should have received a copy of the Phorum License                     //
// along with this program.                                                  //
///////////////////////////////////////////////////////////////////////////////
define('phorum_page','chineseVersion');

session_start();  

$_SESSION['version'] = 1;

if($_POST['ch-forumId'])
   $redir_url = "./index1.php?" . $_POST["ch-forumId"];
else
   $redir_url = "./index1.php";


    if ( stristr( $_SERVER['SERVER_SOFTWARE'], "Microsoft-IIS" ) ) {
        // the ugly IIS-hack to avoid crashing IIS
        print "<html><head>\n<title>Redirecting ...</title>\n";
        print "<meta http-equiv=\"refresh\" content=\"0; URL=$redir_url\">";
        print "</head>\n";
        print "<body><a href=\"$redir_url\">Redirecting ...</a></body>\n";
        print "</html>";
    } else {
        // our standard-way
        header( "Location: $redir_url" );
    }
?>
