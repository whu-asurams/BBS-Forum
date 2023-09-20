<?php

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//   Copyright (C) 2007  Phorum Development Team                              //
//   http://www.phorum.org                                                    //
//                                                                            //
//   This program is free software. You can redistribute it and/or modify     //
//   it under the terms of either the current Phorum License (viewable at     //
//   phorum.org) or the Phorum License that was distributed with this file    //
//                                                                            //
//   This program is distributed in the hope that it will be useful,          //
//   but WITHOUT ANY WARRANTY, without even the implied warranty of           //
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     //
//                                                                            //
//   You should have received a copy of the Phorum License                    //
//   along with this program.                                                 //
////////////////////////////////////////////////////////////////////////////////
define('phorum_page','rnca_list');

include_once("./common.php");
include_once("./include/format_functions.php");
//include_once('./include/timing.php');

//timing_start();

// set all our common URL's
phorum_build_common_urls();

$newflagkey = "rnca";

$offset=0;


// If we only have stickies, the number of pages will be zero.
// In that case, simply use one page.
// if ($pages == 0) $pages = 1;

$pages = 1;
$page = 1;
$page_start=1;
$pageno=1;



$PHORUM["DATA"]["CURRENTPAGE"]=$page;
$PHORUM["DATA"]["TOTALPAGES"]=$pages;


$min_id=0;

$rows = NULL;
// 
//  by hu
//
// $bodies_in_list = isset($PHORUM['TMP']['bodies_in_list']) && $PHORUM['TMP']['bodies_in_list'];
$bodies_in_list = false;


if($PHORUM['cache_messages'] &&
   (!$PHORUM['DATA']['LOGGEDIN'] || $PHORUM['use_cookies']) &&
   !$PHORUM['count_views']) {
    $cache_key = $PHORUM['forum_id']."-".$PHORUM['cache_version']."-".$page."-";
    $cache_key.= $PHORUM['threaded_list']."-".$PHORUM['threaded_read']."-".$PHORUM["language"];
    $cache_key.= "-".$PHORUM["count_views"]."-".($bodies_in_list?"1":"0")."-".$PHORUM['float_to_top'];
    $cache_key.= "-".$PHORUM['user']['tz_offset'];
    $rows = phorum_cache_get('message_list',$cache_key);
}

//
//   by RNCA
//

$rows_T1 = array();
$rows_T2 = array();
$rows_H1 = array();
$rows_H2 = array();
$rows_G1 = array();
$rows_G2 = array();
$rows_R1 = array();
$rows_R2 = array();


if($rows == null) {


    //timing_mark('before db');
    // Get the threads
    $rows = array();
	

    // get the thread set started
    $rows = phorum_db_get_thread_list_rnca($offset, $bodies_in_list);

    //timing_mark('after db');


  
		//
		//  by Hu
		//
		$read_url_template = $PHORUM["http_path"]."/v2/" . "read.php?";
		//
		//

     // loop through and read all the data in.
     foreach($rows as $key => $row){
        $rows[$key]["URL"]["READ"] = $read_url_template. $row['forum_id'] .",". $row['thread'] . ",". $row['message_id'];

	$rows[$key]["forum_name"]= $PHORUM["DATA"]["LANG"]["eric_forumname".$rows[$key]["forum_id"]];
        $rows[$key]["forum_rnca_link"] = "./list.php?".$rows[$key]["forum_id"]; 

        $temp = trim($rows[$key]["sort"]);
        if($temp >100){
          unset($rows[$key]);
          continue;       
        }

        if($temp==3 || $temp == 7){
		$rows_T1[$key] = $rows[$key];
	}elseif($temp==4 || $temp == 8){
		$rows_H1[$key] = $rows[$key];
	}elseif($temp==6 || $temp == 10){
		$rows_G1[$key] = $rows[$key];
	}elseif($temp==5 || $temp == 9){
		$rows_R1[$key] = $rows[$key];
	}else{
	}
     }

}

if($PHORUM['cache_messages'] &&
       (!$PHORUM['DATA']['LOGGEDIN'] || $PHORUM['use_cookies']) &&
       !$PHORUM['count_views']) {
        phorum_cache_put('message_list',$cache_key,$rows);
}




function phorum_db_get_thread_list_rnca($page, $include_bodies=FALSE)
{
    $PHORUM = $GLOBALS['PHORUM'];

    settype($page, 'int');

    $temp = ""; 
	$count=0;
	
    // The messagefields that we want to fetch from the database.
    $messagefields =
       'author, datestamp, email, message_id, forum_id, meta,
        msgid, sort, subject, thread, thread_count, viewcount, threadviewcount';

       $sql = "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 1) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 3) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 4) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 5) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 6) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 7) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 8) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 9) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 10)";
/*
    }else{
       $sql = "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 101) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 103) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 104) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 105) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 106) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 107) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 108) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 109) UNION "
          . "(SELECT $messagefields
                        FROM   {$PHORUM['message_table']}
                        WHERE  status=".PHORUM_STATUS_APPROVED." AND
                               parent_id=0 AND
                               sort = 110)";
    }
*/


        // Query the messages for the current group.
    $rows = phorum_db_interact(DB_RETURN_ASSOCS, $sql, 'message_id');

    return $rows;
}






//timing_mark('after preparation');




//timing_mark('after formatting');

/*
// set up the data
$PHORUM["DATA"]["MESSAGES_T1"] = $rows_T1;
$PHORUM["DATA"]["MESSAGES_T2"] = $rows_T2;
$PHORUM["DATA"]["MESSAGES_G1"] = $rows_G1;
$PHORUM["DATA"]["MESSAGES_G2"] = $rows_G2;
$PHORUM["DATA"]["MESSAGES_H1"] = $rows_H1;
$PHORUM["DATA"]["MESSAGES_H2"] = $rows_H2;
$PHORUM["DATA"]["MESSAGES_R1"] = $rows_R1;
$PHORUM["DATA"]["MESSAGES_R2"] = $rows_R2;
*/

$PHORUM["DATA"]["MESSAGES_T"] = $rows_T1;
$PHORUM["DATA"]["MESSAGES_G"] = $rows_G1;
$PHORUM["DATA"]["MESSAGES_H"] = $rows_H1;
$PHORUM["DATA"]["MESSAGES_R"] = $rows_R1;

//
//  rnca
//
if($PHORUM["forum_id"]>=0){
    $PHORUM["DATA"]["LANG"]["eric_forumname"]=$PHORUM["DATA"]["LANG"]["eric_forumname".$PHORUM["forum_id"]];
	$PHORUM["DATA"]["LANG"]["eric_webmaster"]=$PHORUM["DATA"]["LANG"]["eric_webmaster".$PHORUM["forum_id"]];
    $PHORUM["DATA"]["LANG"]["eric_webmastername"]=$PHORUM["DATA"]["LANG"]["eric_webmastername".$PHORUM["forum_id"]];
    $PHORUM["DATA"]["LANG"]["eric_gramma"]=$PHORUM["DATA"]["LANG"]["eric_gramma".$PHORUM["forum_id"]];
}
//
//
//


//print_var ($PHORUM["DATA"]);

//timing_mark('end');
//timing_print();

?>
