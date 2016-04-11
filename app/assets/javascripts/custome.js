$("document").ready(function() {
	$("#selectAll").change(function () {
    $(".conversationChk").prop('checked', $(this).prop("checked"));
	});
});