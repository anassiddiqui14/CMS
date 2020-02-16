<html>
<head>
<title>
Suggestions  
</title>
<script type="text/javascript">
if(${status})
	alert("Suggestions sent to the admin!");
</script>
<link rel="icon" type="image/png" href="kcc.jpg">
<style>
.text
{
z-index:999;
position:relative;
}
h1
{
margin-left:8%;
margin-top:5%;
}
textarea
{
margin-left:8%;
margin-top:3%;
height:40%;
width:40%;
text-align:left;
}
#btn
{
margin-left:8%;
padding:1%;
}
::-webkit-scrollbar{
display:none;
}
</style>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div clas="text">
<h1>Enter your suggestions in the folllowing box</h1>
<form method="get" action="suggestionServlet">
<textarea placeholder="Enter Suggestions Here" name="tf1" required></textarea><br><br>
<input type="submit" value="Submit" id="btn">
</form>
</div>
</body>
</html>