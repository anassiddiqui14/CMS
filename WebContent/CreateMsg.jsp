<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
if(${status})
alert("Message Sent Succesfully!");
function validateForm() {
	if( document.myForm.tf1.value == "" ) {
        alert( "Please provide your name!" );
        document.myForm.tf1.focus() ;
        return false;
     }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link rel="stylesheet" href="createmsg.css">
</head>

<body>
<div class="header">Create New Message</div>
<form method="get" action="CreateMsgServlet" name="myForm">
To:&nbsp; &nbsp;&nbsp; &nbsp;<input type="text" name="tf1" placeholder="To" id="text" required/><br /><br />
Subject:<input type="text" name="tf2" placeholder="Subject" id="text" required/><br /><br />
<textarea placeholder="Enter Your Message" name="tf3" required></textarea><br /><br />
<input type="submit" value="Send" id="submit"/>
</form>
</body>
</html>
