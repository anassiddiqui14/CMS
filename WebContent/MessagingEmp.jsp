<html>
<head>
<title>
Messaging
</title>
<link rel="stylesheet" href="styleMessaging.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body >
<div id="sidebar">
  <a href="CreateMsg.jsp" target="iframe_b" class="btn">Create</a>
  <a href="inboxEmp.jsp" class="btn active" target="iframe_b">Inbox</a>
  <a href="sentEmp.jsp"  class="btn" target="iframe_b">Sent</a>
  </div>
  <script>
// Add active class to the current button (highlight it)
var header = document.getElementById("sidebar");
var btns = header.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener('click', function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}
</script>
  <iframe src="inbox.jsp" name="iframe_b"></iframe>
</body>
</html>
