
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#attach-image').append('<img id="fileUp" alt="">');
			$('#fileUp').attr('src', e.target.result);
			$('#cancel').removeClass('hide');
		};

		reader.readAsDataURL(input.files[0]);        
	}

	// 취소 추가
	$('#cancel').click(function(){
		$(this).addClass('hide');
		$('#fileUp').remove();
	});
}
