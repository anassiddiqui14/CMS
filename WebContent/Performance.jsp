<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
String Emp_id=hs.getAttribute("empid").toString();
String week1="week1";
String week2="week2";
String week3="week3";
String week4="week4";
String week5="week5";
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection conn = null;
Statement statement = null;
ResultSet resultSet=null;
int count=0;
%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="styleAttendance.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="kcc.jpg">
<style>
::-webkit-scrollbar{
display:none;}
.checked {
  color: orange;
}
.rating
{
float:left !important;
margin-top: 10% !important;
margin-left:3% !important;
}
.chart
{
margin-left:25% !important;
height:50% !important;
width:70% !importnt;
}
select
{
padding:1%;
background-color: #006699;
color: #FFFFFF;
}
.select
{
margin-left:30%;
}
.all
{
padding-top:2%;
}
#curve_chart
{
height:150px;
width:600px;
margin-top:18%;
margin-left:8%;
}

</style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    <%
    conn = DriverManager.getConnection(connectionUrl,userid,password);
    String tmp=Calendar.getInstance().getTime().toString();
    String month[]=tmp.split(" ");
    PreparedStatement st7=conn.prepareStatement("select mid from month where month=?");
    st7.setString(1,month[1]);
    ResultSet rs7=st7.executeQuery();
    rs7.next();
    int mid=Integer.parseInt(rs7.getString(1));
    int lower=mid-5;
    Double salary[]=new Double[13];
    String month1[]=new String[13];
    for(int i=lower;i<=mid;i++)
    {
    	PreparedStatement st8=conn.prepareStatement("select month from month where mid=?");
    	st8.setString(1,Integer.toString(i));
    	ResultSet rs8=st8.executeQuery();
    	rs8.next();
    	String mon=rs8.getString(1)+" "+i;
    	month1[i]=mon;
    }
    for(int i=lower;i<=mid;i++)
    {
    	PreparedStatement st9=conn.prepareStatement("select salary from paidSalary where empid=? and month=?");
    	st9.setString(1,hs.getAttribute("empid").toString());
    	st9.setString(2,month1[i]);
    	ResultSet rs9=st9.executeQuery();
    	PreparedStatement st10=conn.prepareStatement("select salary from paidSalary where empid=? and month=?");
    	st10.setString(1,hs.getAttribute("empid").toString());
    	st10.setString(2,month1[i]);
    	ResultSet rs10=st10.executeQuery();
    	if(rs10.next())
    	{
    	rs9.next();
    	salary[i]=Double.parseDouble(rs9.getString(1));
    	}
    }
    int sal[]=new int[13];
    		for(int i=lower;i<=mid;i++)
    		{
    			if(salary[i]!=null)
    			sal[i]=(int)Math.round(salary[i]);
    		}
    %>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Salary'],
          <%for(int i=lower;i<mid;i++){
          count=i;
          %>
        		  ['<%=month1[count]%>',<%=sal[count]%> ],
          <%}%>
          ['<%=month1[mid]%>',<%=sal[mid]%> ]
        ]);

        var options = {
          title: 'Total Salary Gain',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  <meta charset="utf-8" />

  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   Employee Dashboard
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="orange" data-background-color="white" data-image="./assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="EmployeeDashboard.jsp" class="simple-text logo-normal">
          Employee Dashboard
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item ">
            <a class="nav-link" href="EmpAttendance.jsp">
              <i class="material-icons">A</i>
              <p>Attendance</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="Salary.jsp">
              <i class="material-icons">S</i>
              <p>Salary</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="MessagingEmp.jsp">
              <i class="material-icons">M</i>
              <p>Messaging</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="Suggestions.jsp">
              <i class="material-icons">S</i>
              <p>Suggestions</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Performance.jsp">
              <i class="material-icons">P</i>
              <p>Performance</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;"><%=user %></a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="AccountSettings.jsp">Settings</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="http://localhost:8085/CMS/LogoutServlet">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="all">
 <div class="rating">
 <%
 conn = DriverManager.getConnection(connectionUrl,userid,password);
 PreparedStatement st1=conn.prepareStatement("select rating from rating where empid=?");
 st1.setString(1,Emp_id);
 ResultSet rs1=st1.executeQuery();
 PreparedStatement st2=conn.prepareStatement("select rating from rating where empid=?");
 st2.setString(1,Emp_id);
 ResultSet rs2=st2.executeQuery();
 int rating=0;
 if(rs2.next())
 {
 rs1.next();
 rating=Integer.parseInt(rs1.getString(1));
 }
 %>
	 <img src="images/avatar.jpg" class="avatar" height="200px" width="200px">
	  <h3>Rating</h3>
	  <%for(int i=1;i<=rating;i++){ %>
	 <span class="fa fa-star checked"> </span>
	 <%} %>
	 <%for(int i=1;i<=(5-rating);i++){ %>
<span class="fa fa-star"></span>
<%} %>
		<h3><%=rating %></h3>
	  </div>
  <div class="chart">
    <canvas id="myChart"></canvas>
    </div>
      <script>
      let myChart=document.getElementById('myChart').getContext('2d');
  Chart.defaults.global.defaultFontFamily='Lato';
  Chart.defaults.global.defaultFontSize=15;
  Chart.defaults.global.defaultFontStyle='bold';
  Chart.defaults.global.defaultFontColor='#777';
    let attChart=new Chart(myChart, {
      type:'bar',
      data:{
        labels:['1st Week', '2nd Week', '3rd Week','4th Week','5th week'],
        <%
        try{
        conn = DriverManager.getConnection(connectionUrl,userid,password);
        PreparedStatement st=conn.prepareStatement("select week1, week2, week3 ,week4, weeek5 from empattndnc where Emp_id=? and mid=?");
        String tmp2=Calendar.getInstance().getTime().toString();
        String mid2[]=tmp.split(" ");
        st.setString(1,Emp_id);
        st.setString(2,mid2[1]);
        ResultSet rs=st.executeQuery();
        PreparedStatement st5=conn.prepareStatement("select week1, week2, week3 ,week4, weeek5 from empattndnc where Emp_id=? and mid=?");
        st5.setString(1,Emp_id);
        st5.setString(2,mid2[1]);
        ResultSet rs5=st5.executeQuery();
        if(rs5.next())
        {
        while(rs.next())
        {%>
        datasets:[
        {
          label:'No. of Attendence',
          data:[ 
          <%=rs.getString(1)%>,
          <%=rs.getString(2)%>,
          <%=rs.getString(3)%>,
          <%=rs.getString(4)%>,
          <%=rs.getString(5)%>
          ],
          backgroundColor:['green','red','lightgrey','blue','violet'],
        }
        <%
        }
        conn.close();
    }
        }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    %>
        ]
      },
      options: {
    responsive: true,
    maintainAspectRatio: false,
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    },
}
    });
      </script>
	</div> 
	<div id="curve_chart"></div>
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Filters</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger active-color">
            <div class="badge-colors ml-auto mr-auto">
              <span class="badge filter badge-purple" data-color="purple"></span>
              <span class="badge filter badge-azure" data-color="azure"></span>
              <span class="badge filter badge-green" data-color="green"></span>
              <span class="badge filter badge-warning" data-color="orange"></span>
              <span class="badge filter badge-danger" data-color="danger"></span>
              <span class="badge filter badge-rose active" data-color="rose"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="header-title">Images</li>
        <li class="active">
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="./assets/img/sidebar-1.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="./assets/img/sidebar-2.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="./assets/img/sidebar-3.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="./assets/img/sidebar-4.jpg" alt="">
          </a>
        <li class="button-container text-center">
          <button id="twitter" class="btn btn-round btn-twitter"><i class="fa fa-twitter"></i> </button>
          <button id="facebook" class="btn btn-round btn-facebook"><i class="fa fa-facebook-f"></i> </button>
          <br>
          <br>
        </li>
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="./assets/js/core/jquery.min.js"></script>
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="./assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="../assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="./assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="./assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="./assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="./assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="./assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="./assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="./assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="./assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="./assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="./assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="./assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="./assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

    });
  </script>
</body>

</html>