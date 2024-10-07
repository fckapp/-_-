/**
 * 
 */
$(document).ready(function(){
	$('#loginPage-account-btn').click(function(){
		window.location.href="<%= request.getContextPath() %>/signup";
	});
});