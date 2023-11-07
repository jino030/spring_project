<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지업로드 실습</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
	body {
		color: #666;
		font: 14px/24px "Open Sans", "HelveticaNeue-Light",
			"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
			"Lucida Grande", Sans-Serif;
		width: 75vw;
		max-width: 1280px;
		margin: 0 auto;
	}
	#wrapper {
		margin: 50px auto;
	}
	img {
		width : 300px;
	}
</style>
</head>
<body>
	<!-- 하나의 input에 여러개의 파일을 업로드(multiple)할때 enctype="multipart/form-data" 지정 -->
	<!-- <form enctype="multipart/form-data">
		<input type="file" name="images" multiple>
		<button type="submit">전송</button>
	</form> -->
	
	<!-- form 태그 사용하지않고 비동기처리 -->
	<div id="imageWrap">
		<input type="file" name="uploadFiles" multiple>
		<button class="uploadBtn">Upload</button>
	</div>
	
	<script>
		document.querySelector('.uploadBtn').addEventListener('click', function(e){
			// form이 가지고 있는 내부 데이터를 하나의 클래스로 담는 역할.. 
			// jquery.serialize() or jquery.serializeArray()와 유사
			let formData = new FormData(); 
			// 1) Form 태그 내부의 데이터를 한번에 담음(통신을 위한 정보를 담는다)
			// 2) Ajax를 이용해서 'content-type:multipart/form-data'를 보내는 경우

			let imageFile = document.querySelector('input[type="file"]');
			let fileList = imageFile.files; // 객체타입이라 바로 못보냄..
			console.log(fileList);

			for(let file of fileList) {
				formData.append("uploadFiles", file); //통신을 위해 변수에 데이터를 담는다
			}

			// fetch
			fetch('uploadAjax', {
				method : 'post',
				body : formData
			})
			.then(res => res.json())
			.then(data => console.log(data))
			.catch(err => console.log(err));
			
			//jQuery.ajax
           $.ajax({
               url: 'uploadAjax',	
               type: 'POST',
               //기본값은 true, ajax 통신을 통해 데이터를 전송할 때, 기본적으로 key와 value값을 Query String으로 변환해서 보냅니다.
               processData: false,
               // multipart/form-data타입을 사용하기위해 false 로 지정합니다.
               contentType: false,	
               data: formData,               
               success: function(result){
                   console.log(result);
                   for(let image of result) {
                	   let imgTag = $('<img/>').prop('src', 'images/' + image);
                	   $('#imageWrap').append(imgTag);
                   }
               },
               error: function(reject){	
                   console.log(reject);
               }
           }); 
		})
	</script>
</body>
</html>