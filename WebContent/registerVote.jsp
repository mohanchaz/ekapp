<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META content=""><%@page import="ekapp.*,java.*,java.util.*"%>
<%
	session.setAttribute("referer", "registerVote.jsp");
	Users usr = (Users) session.getAttribute("user");

	if (null == usr) {
		response.sendRedirect("login.jsp");
	} else if (usr.hasVoted()) {
		out.write("Already Voted");
	} else {

		//president=2000&v_president=2001&secretary=2002&j_secretary=2003&treasurer=2004
		ArrayList<String> votedCandidates = new ArrayList<String>();
		votedCandidates.add((String) request.getParameter("president"));
		votedCandidates.add((String) request.getParameter("v_president"));
		votedCandidates.add((String) request.getParameter("secretary"));
		votedCandidates.add((String) request.getParameter("j_secretary"));
		votedCandidates.add((String) request.getParameter("treasurer"));
		Users.voteFor(votedCandidates);
		usr.changeVote();
%>
<jsp:include page="header.jsp" />

<META http-equiv="X-UA-Compatible" content="IE=edge">
<META name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<META name="description" content="">
<META name="author" content="">
<LINK rel="icon" href="images/favicon.ico">


<!-- Bootstrap core CSS -->
<LINK href="css/bootstrap.min.css" rel="stylesheet" />

<LINK href="css/footer.css" rel="stylesheet" />

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<LINK href="/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<LINK href="<c:url value="/css/jumbotron.css"/>" rel="stylesheet" />
<link rel="stylesheet" href="css/sample.css">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<SCRIPT src="js/ie-emulation-modes-warning.js" type="text/javascript"></SCRIPT>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link type="stylesheet" href="css/footer.css">
<title>Register Vote | Shyamlal College</title>
<style type="text/css">
h2 {
	display: block;
	-webkit-margin-before: 0.83em;
	-webkit-margin-after: 0.83em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-family: inherit;
	font-weight: 500;
	line-height: 1.1;
	color: inherit;
	margin-top: 20px;
	font-size: 30px;
	margin-bottom: 10px
}
</style>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div style="align-content: center; width: 50%; align-self: center;"
		class="container">
		<p>
			<%
				out.write(Boolean.toString(usr.hasVoted()));
			%>
		</p>
		<form class="form-signin" action="default.jsp" method="post">
			<h2 class="form-signin-heading">Vote registered successfully!</h2>
			<button style="align-content: center; width: 20%;"
				class="btn btn-lg btn-primary btn-block" type="submit">Home</button>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
<%
	}
%>